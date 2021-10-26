## Programed by Dongjun Lee for predicting amount of soil loss 

## Step#1: Set up functions and work space
setwd("D:/00_AuburnUnisversity/03_Fall,2021/03_Developing_Agent-Based_Models(WILD-7400)/05_ComplexModel/")
directory <- getwd()
outdir <- paste(directory,"/Output/", sep="")
source(paste(directory, "/Source/FunctionSourcer.R", sep="")) 

## Step#2: Define parameters 
nfarmers <- 10 # number of farmers

## Step#3. Initialize Farmer agents' index.
farmers <- FarmersInit(nfarmers)
p_list <- c()
## Step#4. Determine behavior and P value of values 
for (i in 1:nrow(farmers)){
  BI <- as.integer(round(farmers[i,"B"],digits=0)) #BI: Determine agent's behavior 
  Edu_lv <- as.integer(farmers[i,"Edu_lv"]) # Agent's education level
  
  if (BI==1){
    if(Edu_lv==1){p_value <- rnorm(1,mean = 0.9, sd =0.01)}
    if(Edu_lv==2){p_value <- rnorm(1,mean = 0.7, sd =0.01)}
    if(Edu_lv==3){p_value <- rnorm(1,mean = 0.5, sd =0.01)}
  } else {p_value <- 1.0}
  print(c(BI,Edu_lv,p_value))
}

# Distributing P values of each farmer (making P maps) 


## Input data
#1: Rainfall data > peak flow, amount of runoff
#2: DEM > slope, Length > LS map
#3: Soil map > K map
#3: Crop map > C map (monthly)

# Generating soil erosion map based on MUSLE.
