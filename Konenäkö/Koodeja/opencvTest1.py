# Source: https://docs.opencv.org/4.4.0/dd/d43/tutorial_py_video_display.html

#import numpy as np
import cv2 as cv
import time

cap = cv.VideoCapture(0)

if not cap.isOpened():
    print("Cannot open camera")
    exit()
count = 0
while True:
    count = count + 1
    
    # Capture frame-by-frame
    ret, frame = cap.read()    

    # if frame is read correctly ret is True
    if not ret:
        print("Can't receive frame (stream end?). Exiting ...")
        break

    cv.imshow('frame', frame)
    
    # Our operations on the frame come here
    gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
    
    # Display the resulting frame
    cv.imshow('gray', gray)

    if (count % 100) == 0:
        cv.imwrite('C:/tmp/Test_gray' + str(count) + '.jpg', gray) 

    
    if cv.waitKey(1) == ord('q'):
        break
    
# When everything done, release the capture
cap.release()
cv.destroyAllWindows()
