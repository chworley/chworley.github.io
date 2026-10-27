# make_bubble_sheets.R
# Generates a multi-page, US Letter (8.5 x 11 in) PDF of bubble sheets.
# Every page has: a name line, 30 questions with bubbles A-D, four corner
# alignment squares, and a pre-filled two-digit "sheet code" (01, 02, ...)
# written as dark bubbles so a bubble scanner reads it like any other mark.
#
# Run in R with:  source("make_bubble_sheets.R")
# Output: bubble_sheets.pdf  and  bubble_layout.csv (bubble positions, in inches
# measured from the top-left corner of the page, for building a scan template).

# ---------------------------------------------------------------- settings
n_questions <- 30
n_sheets    <- 30          # sheet codes 01 ... 50 (any number up to 99 works)
choices     <- c("A", "B", "C", "D")
test_title  <- "Physics Test, Chapters 2 and 3"
out_pdf     <- "bubble_sheets.pdf"
out_layout  <- "bubble_layout.csv"

# ---------------------------------------------------------------- geometry (inches)
page_w <- 8.5
page_h <- 11
rows_per_col <- 10
n_cols <- ceiling(n_questions / rows_per_col)
if (n_cols > 3) stop("This layout fits at most 30 questions (3 columns of 10).")
if (n_sheets > 100) stop("Two-digit sheet codes allow at most 100 sheets (00-99).")

r_bubble   <- 0.11               # bubble radius (0.22 in diameter)
col_x0     <- c(0.9, 3.5, 6.1)   # left edge of each question column
num_dx     <- 0.30               # question number sits here (right-aligned)
bub_dx     <- 0.55               # first bubble offset from column edge
bub_step   <- 0.38               # horizontal spacing between bubbles
grid_top   <- 3.50               # y of the first question row (from top)
row_pitch  <- 0.60               # vertical spacing between question rows
header_y   <- 3.10               # y of the A/B/C/D letters

code_x0    <- 5.20               # x of the "0" bubble in the sheet-code block
code_step  <- 0.28
code_y_tens <- 1.35
code_y_ones <- 1.75

marker_size  <- 0.30             # corner alignment squares
marker_inset <- 0.40
markers_x <- c(marker_inset, page_w - marker_inset - marker_size)
markers_y <- c(marker_inset, page_h - marker_inset - marker_size)   # distance from top

Y <- function(y_from_top) page_h - y_from_top   # convert to R's bottom-up y

# ---------------------------------------------------------------- bubble positions
q <- seq_len(n_questions)
q_col <- (q - 1) %/% rows_per_col + 1
q_row <- (q - 1) %% rows_per_col + 1
ans <- do.call(rbind, lapply(q, function(i) {
  data.frame(
    field  = "answer",
    label  = paste0("q", i),
    choice = choices,
    x_in   = col_x0[q_col[i]] + bub_dx + bub_step * (seq_along(choices) - 1),
    y_in   = grid_top + row_pitch * (q_row[i] - 1)
  )
}))
code_bubbles <- rbind(
  data.frame(field = "code", label = "tens", choice = 0:9,
             x_in = code_x0 + code_step * (0:9), y_in = code_y_tens),
  data.frame(field = "code", label = "ones", choice = 0:9,
             x_in = code_x0 + code_step * (0:9), y_in = code_y_ones)
)
layout_table <- rbind(ans, code_bubbles)
write.csv(layout_table, out_layout, row.names = FALSE)

# ---------------------------------------------------------------- drawing helpers
draw_bubbles <- function(x, y, filled = FALSE) {
  symbols(x, Y(y), circles = rep(r_bubble, length(x)), inches = FALSE,
          add = TRUE, fg = "black", bg = if (filled) "black" else "white", lwd = 1.3)
}

draw_sheet <- function(sheet) {
  par(mai = c(0, 0, 0, 0), xaxs = "i", yaxs = "i")
  plot.new()
  plot.window(xlim = c(0, page_w), ylim = c(0, page_h))

  # corner alignment squares
  for (mx in markers_x) for (my in markers_y) {
    rect(mx, Y(my + marker_size), mx + marker_size, Y(my), col = "black", border = NA)
  }

  # title, name line
  text(0.9, Y(1.0), test_title, adj = c(0, 0.5), cex = 1.3, font = 2)
  text(0.9, Y(1.55), "Name:", adj = c(0, 0.5), cex = 1.1)
  segments(1.6, Y(1.65), 4.4, Y(1.65), lwd = 1.3)

  # sheet code block (pre-filled with this sheet's number)
  tens <- sheet %/% 10
  ones <- sheet %% 10
  text(code_x0 - 0.11, Y(0.85), "SHEET CODE (already filled in, do not change)",
       adj = c(0, 0.5), cex = 0.55)
  text(code_x0 + code_step * (0:9), Y(1.08), 0:9, cex = 0.6)
  text(code_x0 - 0.22, Y(code_y_tens), "tens", adj = c(1, 0.5), cex = 0.6)
  text(code_x0 - 0.22, Y(code_y_ones), "ones", adj = c(1, 0.5), cex = 0.6)
  draw_bubbles(code_x0 + code_step * (0:9), rep(code_y_tens, 10), filled = FALSE)
  draw_bubbles(code_x0 + code_step * (0:9), rep(code_y_ones, 10), filled = FALSE)
  draw_bubbles(code_x0 + code_step * tens, code_y_tens, filled = TRUE)
  draw_bubbles(code_x0 + code_step * ones, code_y_ones, filled = TRUE)
  text(code_x0 - 0.11, Y(2.15), sprintf("Sheet %02d", sheet),
       adj = c(0, 0.5), cex = 1.0, font = 2)

  # directions
  text(0.9, Y(2.6),
       "Use pencil. Fill in one bubble per question, completely. Erase fully to change an answer.",
       adj = c(0, 0.5), cex = 0.7)

  # answer grid
  for (cc in seq_len(n_cols)) {
    text(col_x0[cc] + bub_dx + bub_step * (seq_along(choices) - 1), Y(header_y),
         choices, cex = 0.85, font = 2)
  }
  draw_bubbles(ans$x_in, ans$y_in, filled = FALSE)
  text(col_x0[q_col] + num_dx, Y(grid_top + row_pitch * (q_row - 1)), q,
       adj = c(1, 0.5), cex = 0.95)
}

# ---------------------------------------------------------------- write the PDF
pdf(out_pdf, width = page_w, height = page_h, paper = "special", onefile = TRUE)
for (s in seq_len(n_sheets)) draw_sheet(s)
invisible(dev.off())

cat("Wrote", n_sheets, "pages to", out_pdf, "and bubble positions to", out_layout, "\n")
