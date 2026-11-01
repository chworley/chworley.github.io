library("exams")

n = 40
set.seed(1234)
seeds = sample(1:10000,n)

exams2pdf(rep("cchh_et3.Rmd",n), template = "exit_ticket.tex",
          name = "exit_ticket3", dir = "pdfs", seed = seeds)
exams2pdf(rep("cchh_et3.Rmd",n), template = "exit_ticket_key.tex",
          name = "exit_ticket_key3", dir = "pdfs", seed = seeds)

