#########################Visualization UI ##################################
#################### detailed legend for Malaria ###########
legend_details=list(
  helpText("Click on the legend to hide/show variables"),
  helpText("Click and drag on the graph to zoom"),
  tags$p(tags$strong("Legend:")),
  helpText("By default,90th percentile is used to compute weekly proportion of sites in alert."),
  conditionalPanel(condition = "input.Algorithmes_eval1=='Ind'",
                   helpText("RDT+ : Number of reported Malaria cases by epidemiological week")
                   ),
  helpText("Rainfall, African Rainfall Estimation (RFE) is produced by NOAA-CPC"), 
  helpText("NDVI, is a normalized difference vegetation index (NDVI)  produced by MODIS"), 
  helpText("Temperature, Land Surface temperature is an estimation of near surface temperature, produced by MODIS"),
conditionalPanel(
  condition = "input.diseases == 'Malaria'",
  helpText("IRS, proportion of sites that received a IRS "),
  helpText("LLIN, proportion of sites that received a LLIN ")
  ))
#
algoviz_display=tabItem(tabName="myalgoviz",
                        conditionalPanel(condition = "input.diseases=='ILI'",
                        fluidRow(
                         plotlyOutput("ili_graph")),
                        tags$br(),
                       fluidRow(
                         plotlyOutput("propili"))
                        ),
                        conditionalPanel(condition = "input.diseases!='ILI'",
                        fluidRow(
                          plotlyOutput("propsite_alerte"))
                        
                        ),
                       conditionalPanel(condition = "input.diseases!='ILI'",
                                        legend_details)
)