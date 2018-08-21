# phenocam

This project captures zoomed in images of Eucalyptus tereticornis tree canopy, named by convention for use with ImageJ to stitch images together to compose mosaic images

Images are captured twice daily (9:30am; 15:00pm) from all 6 rings at the EucFACE facility, Western Sydney University. 

to use, run "run.R" script which will use camera positions found in "camera_position.csv", and "labels.R" to correct the labels for image names. 

Needs to be used in conjunction with "camfunctions.R"

Needs user name, password, and HIEv token stored in filename "data/user.yaml"
