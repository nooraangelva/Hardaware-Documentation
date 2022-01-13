import numpy as np
import cv2
import os

# Luetaan kuva
polku = os.path.join(os.getcwd(),'Kuvat','Normaalit','kolikot_2.bmp')
#polku = os.path.join(os.getcwd(),'Kuvat','Normaalit','opetuskuva_alavalo.bmp')
kuva = cv2.imread(polku)
kuva = cv2.cvtColor(kuva, cv2.COLOR_BGR2GRAY)
cv2.imshow('kuva', kuva)

# Reunojen haku
thresh = cv2.Canny(kuva,100,200)
cv2.imshow('binary2', thresh)

# Luokittelu
retval, labels, stats, centroids = cv2.connectedComponentsWithStats(thresh, 8, cv2.CV_32S)
print(stats[:,4])

# Tunnistus ja rahamäärän laskenta
summa = 0
for pikslkm in stats[:,4]:
    if pikslkm < 300:
        pass
    elif pikslkm < 330:
        summa = summa + 0.1
    elif pikslkm < 350:
        summa = summa + 0.05
    elif pikslkm < 375:
        summa = summa + 0.2
    elif pikslkm < 390:
        summa = summa + 1
    elif pikslkm < 410:
        summa = summa + 0.5
    elif pikslkm < 500:
        summa = summa + 2

print(round(summa,2))
