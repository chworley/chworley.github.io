library("exams2forms")
n = 50

### Entrance ticket
pm = list("vector_add_same.Rmd",
          "vector_add_opp.Rmd",
          "vector_add_zero.Rmd",
          "vector_add_easy.Rmd",
          "vector_add_easy.Rmd",
          "vector_add_easy.Rmd")

exams2webquiz(pm,
             n=n,
             title = "vector_practice",
             dir = ".",
             name="vector_practice")



