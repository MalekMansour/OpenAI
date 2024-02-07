import cv2
import numpy as np

img = cv2.imread("images/img.png")
height, width, _ = img.shape
scale_factor = 800 / max(height, width)
img = cv2.resize(img, (int(width * scale_factor), int(height * scale_factor)))

gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
gray = cv2.medianBlur(gray, 5)
white = cv2.adaptiveThreshold(gray, 255, cv2.ADAPTIVE_THRESH_MEAN_C,
                              cv2.THRESH_BINARY, 9, 9)
color = cv2.bilateralFilter(img, 9, 250, 250)
cartoon = cv2.bitwise_and(color, color, mask=white)

cv2.imshow("Original", img)
cv2.imshow("Cartoon", cartoon)
cv2.imshow("White", white)
cv2.waitKey(0)
cv2.destroyAllWindows()