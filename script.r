source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
library(leaflet)
####################################################

################### Actual code ####################
labels <- paste0("Locality: ", Values$locality,                        
                 ",  Center: ", Values$center)%>% lapply(htmltools::HTML) ;

p=leaflet(Values) %>%
  setView(lng=77.2096, lat=28.68746, zoom=11) %>%
  addTiles() %>%
  addScaleBar %>%
  addMarkers(~longitude, ~latitude,
             label = labels,  
             clusterOptions = markerClusterOptions());

####################################################

############# Create and save widget ###############
internalSaveWidget(p, 'out.html')
####################################################
