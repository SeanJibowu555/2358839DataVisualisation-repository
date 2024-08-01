#install.packages("rsconnect", repos = "https://cran.r-project.org")

library(rsconnect)

 

rsconnect::setAccountInfo(name='seanjibowu', token='865698C544BFEA82653A7A18EB9C6317', secret='WKWY0YCktuPF4vbJS9v7Qv/UA2QEA4iT1m/Sj7zs')

rsconnect::deployApp('Users/seanjibowu/2358839DataVisualisationrepository')
