### 0. --------- CROP INPUT DATA ---------- ###
###    1. Crop Management
###    2. Crop Parameters
###    3. Parameters for calculated the Tuber Induction Index (TII)
###    4. Parameters for Water Balance
###    5. Temperatures: Frost Limited
###    6. CO2 Concentration
###    7. Data for calculate the Potential Evapotranspiration (ETo)
### 0. ------------------------------------ ###

### 1. ---------- Crop Management ---------- ###
 filename = FileName    # Read the climate data
#
  sowing = SOW          # Planting day    (yyyy-mm-dd)
 harvest = HAR          # Harvest day     (yyyy-mm-dd)
#
         EDay = EDAY    # Emergence day   (days after planting)
 plantDensity = pDEN  	# Plant density   (plant m-2)
### 1. ------------------------------------- ###

### 2. ---------- Crop Parameters ---------- ###
 wmax = p1        # Maximum canopy cover index                       (fraction)
   te = p2        # TT at the maximum canopy cover value             (°C Day)
   tm = p3   	    # TT at the maximum canopy cover growth rate       (°C Day)
#
  A = p4 		      # Maximum Harvest Index                            (fraction)
 tu = p5 		      # TT at maximum tuber partition rate               (°C Day)
  b = p6          # TT just before the tuber initiation process      (°C Day)
#
    RUE = p7   		# Average radiation use efficiency                 (g MJ-1)
 DMCont = p8   		# Dry matter concentration of tubers               (fraction)
### 2. ------------------------------------- ###

### 3. ---------- Parameters for calculated the Tuber Induction Index (TII) ---------- ###
 Tb = 4          	# Minimum Temperature for tuber initiation     (°C)
 To = 17         	# Optimum temperature for tuber initiation     (°C)
 Tu = 32         	# Maximum Temperature for tuber initiation     (°C)
#
 Pc = 15          # Critical Photperiod                          (hour)
  w = 0.6         # Photperiod Sensivity                         (hour-1)
### 3. ------------------------------------------------------------------------------- ###

### 4. ---------- Parameters for Water Balance ---------- ###
 Soil_depth = 0.3     # Soil depth in the root zone   (m)
       Area = 10000   # To determine the soil volume
# 
  fc = pFC       # Field Capacity            (% vol)
  wp = pWP       # Wilting Point             (% vol)
 ISM = pISM      # Initial Soil Moisture     (% vol)
### 4. -------------------------------------------------- ###

### 5. ---------- Temperatures: Frost Limited ---------- ###
 Tcr = -1.0     # Critical temperature        (°C)
 Tld = -3.0     # Leaves dead temperature     (°C)
 Trg = -4.0     # Regrowth                    (°C)
### 5. ------------------------------------------------- ###
 
### 6. ---------- CO2 Concentration ---------- ###
# CO2AirConcent = 400   # CO2 Concentration (ppm)
### 6. --------------------------------------- ###

### 7. ---------- Data for calculate the Potential Evapotranspiration (ETo) ---------- ###
 Lat_Degrees = Lat_D          #
 Lat_Minutes = Lat_M          # Latitude
 Lat_Seconds = 0              #
#           z = Elevation      # Elevation    (masl)
  Latitude = Latitude_L
 Elevation = Elevation_E
#           
 Hemisphere = 1          # 1: North  &  -1: South
#
 coef_a = 0.2						 #
 coef_b = 0.46           #
     U2 = 2.0            # Kind of wind : Weak
#
 useRefIrri = 0          # 
### 7. -------------------------------------------------------------------------------- ###
 
 
 