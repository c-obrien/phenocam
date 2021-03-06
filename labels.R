# Change numbers into strings suitable for stitching with imageJ

XX <- as.character(cam_pos$x_pan)
YY <- as.character(cam_pos$y_tilt)

XX[XX == "1"] <- "001"
XX[XX == "2"] <- "002"
XX[XX == "3"] <- "003"
XX[XX == "4"] <- "004"
XX[XX == "5"] <- "005"
XX[XX == "6"] <- "006"
XX[XX == "7"] <- "007"
XX[XX == "8"] <- "008"
XX[XX == "9"] <- "009"
XX[XX == "10"] <- "010"
XX[XX == "11"] <- "011"
XX[XX == "12"] <- "012"
XX[XX == "13"] <- "013"
XX[XX == "14"] <- "014"
XX[XX == "15"] <- "015"
XX[XX == "16"] <- "016"
XX[XX == "17"] <- "017"
XX[XX == "18"] <- "018"
XX[XX == "19"] <- "019"
XX[XX == "20"] <- "020"
XX[XX == "21"] <- "021"

YY[YY == "1"] <- "001"
YY[YY == "2"] <- "002"
YY[YY == "3"] <- "003"
YY[YY == "4"] <- "004"
YY[YY == "5"] <- "005"
YY[YY == "6"] <- "006"
YY[YY == "7"] <- "007"
YY[YY == "8"] <- "008"
YY[YY == "9"] <- "009"
YY[YY == "10"] <- "010"
YY[YY == "11"] <- "011"
YY[YY == "12"] <- "012"
YY[YY == "13"] <- "013"
YY[YY == "14"] <- "014"
YY[YY == "15"] <- "015"
YY[YY == "16"] <- "016"
YY[YY == "17"] <- "017"
YY[YY == "18"] <- "018"
YY[YY == "19"] <- "019"
YY[YY == "20"] <- "020"
YY[YY == "21"] <- "021"
YY[YY == "22"] <- "022"
YY[YY == "23"] <- "023"
YY[YY == "24"] <- "024"
YY[YY == "25"] <- "025"
YY[YY == "26"] <- "026"
YY[YY == "27"] <- "027"
YY[YY == "28"] <- "028"
YY[YY == "29"] <- "029"
YY[YY == "30"] <- "030"
YY[YY == "31"] <- "031"

cam_pos$x_pan <- XX
cam_pos$y_tilt <- YY