INF = read.csv('Input Information.csv')
CPR = read.csv('Parameters - N points.csv')

inn = dim(CPR)[1]

for(iyy in 1:15){

Y_OUT = matrix(nrow = inn, ncol = 13)

for(k in 1:inn){
  
  p1 = CPR[k, 1]
  p2 = CPR[k, 2]
  p3 = CPR[k, 3]
  p4 = CPR[k, 4]
  p5 = CPR[k, 5]
  p6 = CPR[k, 6]
  p7 = CPR[k, 7]
  p8 = CPR[k, 8]
  
  ER_1 = vector()
  ER_2 = vector()
  ER_3 = vector()
  ER_4 = vector()
  ER_R = vector()


  FileName = paste(as.character(INF$file[iyy]),'.csv', sep = "")
  SOW = as.character(INF$planting[iyy])
  HAR = as.character(INF$harvest[iyy])
  EDAY = as.numeric(as.Date(INF$Emergence[iyy])-as.Date(INF$planting[iyy]))
  pDEN = INF$density[iyy]
  pFC = INF$field.capacity[iyy]
  pWP = INF$wilting.point[iyy]
  pISM = INF$initial.water.content[iyy]
  Lat_D = INF$latitude_deg[iyy]
  Lat_M = INF$latitude.min[iyy]
  Elevation_E = INF$elevation[iyy]
  Latitude_L = INF$latitude[iyy]
  UsRefIrri = INF$userefirri[iyy]
  
  OBS_FileName = paste(as.character(INF$OBS_file[iyy]),'.csv', sep = "")
  OBS = read.csv(OBS_FileName)
  OUT_FileName = paste('OUT_',as.character(INF$file[iyy]),'_I.csv', sep = "")
  
source("WaterLimited_PG_Photoperiod_HeatStress_v2.7c.R")  
  
  Year = climate$Year
  doy = climate$DOY 
  tuber_yield_fresh = fty_C
  tuber_yield_dry = dty_C
  green_leaf = rep("na", timeDuration)
  total_leaf = rep("na", timeDuration)
  stem = rep("na", timeDuration)
  green_top = rep("na", timeDuration)
  total_top = ifelse(tdm_C - fty_C < 0., 0, tdm_C - fty_C)
  root = rep("na", timeDuration)
  green_total = rep("na", timeDuration)
  total = tdm_C
  LAI = rep("na", timeDuration)
  Canopy_Cover = CC_W
  
  Cumulative_ET = cumsum(climate$ETo)
  Cumulative_water_loss = rep("na", timeDuration)
  Plant_available_soil_water_to_max_root_depth = ASWC
  
  Cumulative_N_uptake = rep("na", timeDuration)
  Cumulative_N_leached = rep("na", timeDuration)
  Soil_mineral_N_to_max_root_depth = rep("na", timeDuration)
  
#  OUT = data.frame(Year, doy, tuber_yield_fresh, tuber_yield_dry, green_leaf, total_leaf, stem, green_top, total_top, root, green_total, total, LAI, Canopy_Cover,"", Cumulative_ET, Cumulative_water_loss, Plant_available_soil_water_to_max_root_depth, "", Cumulative_N_uptake, Cumulative_N_leached, Soil_mineral_N_to_max_root_depth)
  
#  write.csv(OUT, "FORMAT_OSW98_Ce.csv")
  OUT2 = data.frame(DOY , DTY = dty_C, TDM = tdm_C, HI = HI_P, FTY = fty_C)
  DOY_o = as.numeric(as.Date(OBS$Date)-as.Date(Year_o)) + 1
  nD = length(DOY_o)
  
  RR1 = OBS$Dry_matter_tuber*0.001
  RR2 = OBS$Dry_matter_total*0.001
  RR3 = OBS$Harvest_Index
  RR4 = OBS$Fresh_matter_tuber*0.001
  
  rr1 = vector()
  rr2 = vector()
  rr3 = vector()
  rr4 = vector()
  
  for(ki in 1:nD){
    rRr = DOY_o[ki]
    rr1[ki] = OUT2[OUT2$DOY == rRr, 2]
    rr2[ki] = OUT2[OUT2$DOY == rRr, 3]
    rr3[ki] = OUT2[OUT2$DOY == rRr, 4]
    rr4[ki] = OUT2[OUT2$DOY == rRr, 5]
  }
  
  er1 = abs(RR1-rr1)/RR1*100
  er2 = abs(RR2-rr2)/RR2*100
  er3 = abs(RR3-rr3)/RR3*100
  er4 = abs(RR4-rr4)/RR4*100
  
  ER1 = mean(er1, na.rm = TRUE)
  ER2 = mean(er2, na.rm = TRUE)
  ER3 = mean(er3, na.rm = TRUE)
  ER4 = mean(er4, na.rm = TRUE)
  
  ERR = c(ER1, ER2, ER3, ER4)
  ER = mean(ERR, na.rm = TRUE)
  
#  ER_1[iyy] = ER1
#  ER_2[iyy] = ER2
#  ER_3[iyy] = ER3
#  ER_4[iyy] = ER4
#  ER_R[iyy] = ER
#}
  
#  Y_OUT1 = c(p1, p2, p3, p4, p5, p6, p7, p8, mean(ER_1), mean(ER_2), mean(ER_3), mean(ER_4), mean(ER_R))
  Y_OUT1 = c(p1, p2, p3, p4, p5, p6, p7, p8, ER1, ER2, ER3, ER4, ER)
  Y_OUT[k, ] = Y_OUT1
  show(k)
}
colnames(Y_OUT) = c("p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "ER1", "ER2", "ER3", "ER4", "ER")
Y_OUT = data.frame(Y_OUT)
Y_OUT = Y_OUT[order(Y_OUT$ER), ] # Orden directo
write.csv(Y_OUT, OUT_FileName)

#write.csv(data.frame(climate$Prec, climate$Irri, climate$ETo, RI, ASWC, aswc),"OUT_Irrigation_III.csv")
}
