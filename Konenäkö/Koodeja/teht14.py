import numpy as np
import cv2
import os

# Luetaan kuva
polku = os.path.join(os.getcwd(),'Kuvat','Normaalit','kolikot_2.bmp')
kuva = cv2.imread(polku)
kuva = cv2.cvtColor(kuva, cv2.COLOR_BGR2GRAY)
cv2.imshow('kuva', kuva)

# Kynnystys
ret,thresh = cv2.threshold(kuva, 30, 255, cv2.THRESH_BINARY_INV)
cv2.imshow('binary', thresh)

# Luokittelu
retval, labels, stats, centroids = cv2.connectedComponentsWithStats(thresh, 8, cv2.CV_32S)
print(stats[:,4])

# Tunnistus ja rahamäärän laskenta
summa = 0
for pikslkm in stats[:,4]:
    if pikslkm < 5000:
        pass
    elif pikslkm < 6500:
        summa = summa + 0.1
    elif pikslkm < 7500:
        summa = summa + 0.05
    elif pikslkm < 8000:
        summa = summa + 0.2
    elif pikslkm < 9000:
        summa = summa + 1
    elif pikslkm < 10000:
        summa = summa + 0.5
    elif pikslkm < 12000:
        summa = summa + 2

print(round(summa,2))
