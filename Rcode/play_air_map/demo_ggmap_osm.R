# installing OpenStreetMap requires rgdal
# on Mac,
#     # takes a long time
#     $ brew install gdal --enable-opencl --enable-armadillo
#     # install rgdal
#     > install.packages("rgdal", configure.args="-with-proj-include=/usr/local/lib")
#     # install OpenStreetMap
#     > install.packages("OpenStreetMap")

# see http://blog.fellstat.com/?cat=15

library(ggplot2)
library(OpenStreetMap)
# launchMapHelper() # this crash on Mac R 3.0.2, try to figure it out

map <- openmap(c(lat= 25.04,   lon= 121.520),
              c(lat= 25.025,   lon= 121.535),
               minNumTiles=16, type="osm")
mapLatLon <- openproj(map)
g <- autoplot(mapLatLon)
# show 政大公企 location
g <- g + geom_point(data=NULL, x=121.52780, y=25.03049, size=7, color="red", fill="pink", shape=23)
g + labs(title="政大公企位置") +
  theme(text=element_text(family="Heiti TC Medium", size=16))
