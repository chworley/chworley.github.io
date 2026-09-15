library("exams2forms")
n = 10

### Entrance ticket
pm = list("calipers.Rmd")

exams2webquiz(pm,
             n=n,
             title = "calipers_practice",
             dir = ".",
             name="calipers_practice")



