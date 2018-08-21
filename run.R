# Script to capture images of EucFACE canopy and store in folders
# organised by date > ring > treeID > image.

# Images are named based on position within larger image as we are taking multiple
# zoomed in images to stitch together

if(!require("pacman")){
  install.packages("pacman")
}
pacman::p_load(RCurl, HIEv, yaml)

# Load camera functions

source("camfunctions.R")

# Load login details

.user <- yaml.load_file("data/user.yml")
.LOGIN <- .user$login
.PASS <- .user$password
.TOKEN <- .user$token

# Load camera positions

cam_pos <- read.csv("data/camera_position.csv")
source("labels.R")

# Function takes Sys.Date() and Sys.time() and returns in desired format

tidy_date_time <- function(Date, Time){
  tidy_date <- gsub("-", "", Date)
  tidy_time <- gsub(":", "", substr(Sys.time(), 12, 16))
  return(paste(tidy_date, tidy_time, sep = "_"))
}

# Creates new folder for the days images
# Naming convention. Remove dashes from date YYYYMMDD_HHMM
# FACE_AUTO_RA_CANOPYPHOTOS_R_{DATE}_{TIME}.zip

date_time <- tidy_date_time(Sys.Date(), Sys.time())
# dir.create(paste0("images/FACE_AUTO_RA_CANOPYPHOTOS_R_", date_time))
dir.create(paste0("C:/Data/camera/Pheno/FACE_AUTO_RA_CANOPYPHOTOS_R_", date_time))
# Use nested for loops to:
# 1. Create folder for ring and subset camera positions based on ring
# 2. Create folder for tree
# 3. Take images and name them according to position X{xx}_Y{yy}_Z{zz}.jpg

ring_label <- unique(cam_pos$ring)

for(i in 1:length(ring_label)){
  
  # Create Ring folder; Subset data for ring; Make tree label for ring
  
  # dir.create(paste0("images/FACE_AUTO_RA_CANOPYPHOTOS_R_", date_time, "/ring_", ring_label[i]))
  dir.create(paste0("C:/Data/camera/Pheno/FACE_AUTO_RA_CANOPYPHOTOS_R_", date_time, "/ring_", ring_label[i]))
  dataxring <- cam_pos[cam_pos$ring == ring_label[i],]
  pos_label <- unique(dataxring$pos)
  
  for(j in 1:length(unique(dataxring$pos))){
    
    # Create folder for position (E/W); Subset data for tree
    
    # dir.create(paste0("images/FACE_AUTO_RA_CANOPYPHOTOS_R_", date_time,
    dir.create(paste0("C:/Data/camera/Pheno/FACE_AUTO_RA_CANOPYPHOTOS_R_", date_time,
                      "/ring_", ring_label[i], "/pos_", pos_label[j]))
    
    dataxpos <- dataxring[dataxring$pos == pos_label[j],]
    
    for(k in 1:nrow(dataxpos)){
      
      # Make images; setAbsoluteCameraPosition, getCameraJPG
      
      # Images named suitable for fiji/imageJ. Tile_X{xx}_Y{yy}_Z{zz}.jpg
      
      with(dataxpos, setCameraAbsolutePosition(getCamera(ring[k]), pan = pan[k],
                                             tilt = tilt[k], zoom = zoom[k]))
      
      Sys.sleep(3)
      
      # getCameraJPG(getCamera(ring_label[i]), paste0("images/FACE_AUTO_RA_CANOPYPHOTOS_R_", date_time,
      getCameraJPG(getCamera(ring_label[i]), paste0("C:/Data/camera/Pheno/FACE_AUTO_RA_CANOPYPHOTOS_R_", date_time,
                                                    "/ring_", ring_label[i], "/pos_", pos_label[j],
                                                    "/image_X", dataxpos$x_pan[k], "_Y", dataxpos$y_tilt[k], 
                                                    "_Z001", ".jpg"))
    }
  }
}



