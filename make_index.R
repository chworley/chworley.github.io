sss = "<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>Worley Files</title>
</head>
<body>


"

ddd = list.dirs("./",TRUE,TRUE)
for(dir in ddd){
  fls = list.files(dir)
  for(fl in fls){
    if(grepl(".html",fl,fixed=T) || grepl(".pdf",fl,fixed=T)){
      s1 = paste0(substring(dir,3),"/",fl,collapse="")
      sss = paste0(sss,"<a href=https://chworley.github.io",s1,">",s1,"</a><br>")
    }
    if(grepl(".html",fl,fixed=T) && grepl("examp",fl,fixed=T)){ 
      s1 = paste0(substring(dir,3),"/",fl,collapse="")
      sss = paste0(sss,"<a href=https://chworley.github.io",s1,">",s1,"</a><br>")
    }
  }
}

sss = paste0(sss,"</body>")

fileConn<-file("index.html")
writeLines(sss, fileConn)
close(fileConn)

