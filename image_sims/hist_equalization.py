import numpy as np
import skimage
from skimage import io
from skimage import filters
from skimage import exposure
from skimage import color
import matplotlib.pyplot as plt

# Enchance image contrast in large, uniform regions 
# https://scipy-lectures.org/packages/scikit-image/index.html#scikit-image
# Uses histogram equalization: https://en.wikipedia.org/wiki/Histogram_equalization

pic = io.imread('CubeSenseEarth.jpg')
pic = color.rgb2gray(pic)
pic_equalized = exposure.equalize_hist(pic)
plt.imshow(pic_equalized, cmap=plt.cm.gray)
plt.savefig('CubeSenseEarth_new.jpg')
