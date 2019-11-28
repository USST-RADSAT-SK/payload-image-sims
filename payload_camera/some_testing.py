# Testing for plotting tech for orbit simulations


import math
import matplotlib.pyplot as plot
from mpl_toolkits.mplot3d import Axes3D
import numpy as np

fig = plot.figure()
ax = fig.add_subplot('111', projection='3d')


# Creates a sphere for plotting
class Sphere:
    def __init__(self, x_offset=0, y_offset=0, z_offset=0, x_scale=10, y_scale=10, z_scale=10):
        self.x = x_offset
        self.y = y_offset
        self.z = z_offset
        self.xscale = x_scale
        self.yscale = y_scale
        self.zscale = z_scale
        self.xsurface = None
        self.ysurface = None
        self.zsurface = None
        self.calculateSurfaces()

    def calculateSurfaces(self):
        u = np.linspace(0, 2 * np.pi, 100)
        v = np.linspace(0, 1 * np.pi, 100)
        self.xsurface = self.x + self.xscale * np.outer(np.cos(u), np.sin(v))
        self.ysurface = self.y + self.yscale * np.outer(np.sin(u), np.sin(v))
        self.zsurface = self.z + self.zscale * np.outer(np.ones(np.size(u)), np.cos(v))

    # Draws the sphere on the current plot
    # Not yet working properly
    def draw(self, color='b'):
        ax.plot_surface(self.xsurface, self.ysurface, self.zsurface, color)

    # Rebuilds sphere with new position
    def newPosition(self, x_offset, y_offset, z_offset):
        self.x = x_offset
        self.y = y_offset
        self.z = z_offset
        self.calculateSurfaces()

    # Rebuilds sphere with new scaling
    def newScale(self, x_scale, y_scale, z_scale):
        self.xscale = x_scale
        self.yscale = y_scale
        self.zscale = z_scale
        self.calculateSurfaces()


earth = Sphere()
orbiter = Sphere(10, 10, 10, 1, 1, 1)

# Plot the surface
ax.plot_surface(earth.xsurface, earth.ysurface, earth.zsurface, color='b')


for count in range(10):
    orbiter.newPosition(orbiter.x+1, orbiter.y+1, orbiter.z+1)
    ax.plot_surface(orbiter.xsurface, orbiter.ysurface, orbiter.zsurface, color='r')

plot.show()

