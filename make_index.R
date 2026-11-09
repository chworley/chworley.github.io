# Builds index.html: a page of links to every .html and .pdf file in this
# folder and all subfolders. Run it from the root folder of the website
# (the folder that holds the chworley.github.io repo).

base_url <- "https://chworley.github.io/"

# Every .html and .pdf file, as paths like "physics/Ch 4 Quiz.pdf".
# recursive = TRUE searches subfolders; hidden folders like .git are skipped.
files <- list.files(".", pattern = "\\.(html|pdf)$",
                    recursive = TRUE, ignore.case = TRUE)

# Don't link the index page to itself
files <- files[files != "index.html"]

# Link text: escape characters that have special meaning in HTML
link_text <- gsub("&", "&amp;", files, fixed = TRUE)
link_text <- gsub("<", "&lt;", link_text, fixed = TRUE)
link_text <- gsub(">", "&gt;", link_text, fixed = TRUE)

# Link address: URLencode turns spaces into %20 but keeps the slashes
links <- paste0('<a href="', base_url, URLencode(files), '">',
                link_text, '</a><br>')

page <- c("<!DOCTYPE html>",
          "<html>",
          "<head>",
          "<meta charset='utf-8' />",
          "<title>Worley Files</title>",
          "</head>",
          "<body>",
          "",
          links,
          "",
          "</body>",
          "</html>")

writeLines(page, "index.html")
