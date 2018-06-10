Interactive Map Visualization on Earthquakes off Fiji - Shiny App Course Project
========================================================
author: Vasudevan Durairaj
date: 08/June/2018
autosize: true

About the application
========================================================

This Shiny Application was built to analyze the Locations of Earthquakes recorded off Fiji since year 1964. It includes 1000 seismic events of MB > 4.0 as available in quakes dataset. 

- It has a simple user friendly interface with Side panel containing input filters like Stations, Depth and Magnitude of the seismic events recorded. 

- On application launch, the filter inputs are defaulted with its mean value of recordings. The filter inputs would plot the seismic locations with all values less than or equal to slider value set. 

- There are additional control on the input panel, wherein a option to plot all points available in the data set is given and also an option to Reset all filter inputs to its mean value is also provided.

- The Interactive Map Visualization built using leaflet is plotted on the main panel based on the filtered inputs applied on the dataset with circle markers clustered in to group. The Radius of circle markers is plotted in proportion to the depth of seismic event location.

- The Map is interactive which can be drilled through and up by zooming in/out and on click of circle markers, the popup is shown displaying the magnitude and depth of the seismic location. 

- The Plotted count of locations is shown in the right bottom section underneath the map in order to clearly depict the analyzed seismic locations

The dataset
========================================================
The application is built based on the dataset "quakes"" which is available under datasets package in R. It is one of the Harvard PRIM-H project data sets which was in turn obtained from Dr. John Woodhouse, Dept. of Geophysics, Harvard University 


```r
## Sample records of data set
head(quakes,6)
```

```
     lat   long depth mag stations
1 -20.42 181.62   562 4.8       41
2 -20.62 181.03   650 4.2       15
3 -26.00 184.10    42 5.4       43
4 -17.97 181.66   626 4.1       19
5 -20.42 181.96   649 4.0       11
6 -19.68 184.31   195 4.0       12
```

```r
## Structure of data set
str(quakes)
```

```
'data.frame':	1000 obs. of  5 variables:
 $ lat     : num  -20.4 -20.6 -26 -18 -20.4 ...
 $ long    : num  182 181 184 182 182 ...
 $ depth   : int  562 650 42 626 649 195 82 194 211 622 ...
 $ mag     : num  4.8 4.2 5.4 4.1 4 4 4.8 4.4 4.7 4.3 ...
 $ stations: int  41 15 43 19 11 12 43 15 35 19 ...
```

User Interface - Interactive Map Visualization
========================================================

This Application is hosted in shinyapps.io and a screenshot of it is available below. 

![alt text](quake.png)

Application Resources
========================================================

Hosted Application Link 
<https://maddev.shinyapps.io/Earthquake_Visualization/>

Source Code Repository Link 
<> 

Presentation document Link 
<> 
