## Programed by Dongjun Lee for developing Simple Model. 

## Step#1: Set up functions and work space
setwd("D:/00_AuburnUnisversity/03_Fall,2021/03_Developing_Agent-Based_Models(WILD-7400)/04_SimpleModel")
directory <- getwd()
outdir <- paste(directory,"/output/", sep="")
source(paste(directory, "/source/FunctionSourcer.R", sep=""))

## Step#2: Define parameters 
elevation <- c(0,400)
landscape <- 150
nindvs <- 500
nstep <- 500
move <-0.8  # probability of moving to a higher elevation patch.


## Step#3. Initialize landscape.
land <- LandscapeInit(elevation, landscape)
image(land)  

## Step#4. Initialize individuals on the landscape. 
pop <- NewPop(nindvs, landscape)
points(pop[,1]/150, pop[,2]/150, pch = 19, cex=0.5)

## Step#5. Move individuals.
pathways = NULL

for(i in 1:nrow(pop)){
  indv = pop[i,,drop=FALSE]
  
  movepath = MoveIndv(indv, land, move, nstep, elevation, landscape )
  
  ## Step#6. Extract needed information
  lines(movepath[seq(1,length(movepath), 2)]/150, 
       movepath[seq(2,length(movepath), 2)]/150, lwd=2)
  
  pathways = rbind(pathways, movepath)
  
}





