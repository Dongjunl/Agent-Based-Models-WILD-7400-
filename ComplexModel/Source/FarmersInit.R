FarmersInit = function(nfarmers){
  ############################################
  ## Parameters explanation
  # Age: Farmer agents' age
  # Edu_lv: Faremr agents' education level.
  # FS: Farmland size (m^2)
  # AT: Agents' attitude values
  # SN: Agents' subjective norm values
  # PBC: Perceived behavioral control 
  # I: Intentsion level
  # B: Behavior decision 
  ###########################################
  
  # genterate input data
  index_age = as.integer(runif(nfarmers, min=25, max=60))  # genterate age
  index_Edu_lv = as.integer(runif(nfarmers, min=1, max=3))
  index_FS = runif(nfarmers, min=500, max=1000)  # It will be changed by input data (landuse data)
  index_AT = rnorm(nfarmers, mean = 2.11, sd=1.19) # Based on Parasa et al., (2019)
  index_SN = rnorm(nfarmers, mean = 2.39, sd=1.03) # Based on Parasa et al., (2019)
  index_PBC = rnorm(nfarmers, mean = 1.89, sd=0.68) # Based on Parasa et al., (2019)
  
  # Calculate agents' intention and behavior
  index_I = 0.398*index_AT + 0.301*index_SN + 0.194*index_PBC
  index_B = 0.493*index_PBC + 0.619*index_I
  
  ## Making matrix for faremrs.
  index_farmer <- cbind(index_age,index_Edu_lv,index_FS,index_AT,index_SN,index_PBC,index_I,index_B)
  
  # Set column names 
  colnames(index_farmer) <- c("Age","Edu_lv","FS","AT","SN","PBC","I","B")
  
  return(index_farmer)
}