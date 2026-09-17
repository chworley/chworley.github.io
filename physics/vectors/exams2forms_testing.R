library("exams2forms")
n = 50

### Entrance ticket
pm = list("vector_add_2d_graph.Rmd")

exams2webquiz(pm,
             n=n,
             title = "vector_2d_practice",
             dir = ".",
             name="vector_2d_practice")



