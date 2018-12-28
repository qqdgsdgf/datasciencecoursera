
# plotting
## 3 core plotting system + plotting devices
### systems:
1. base
- Plot is just a series of R commands
- Use annotation functions to add/modify (text, lines, points, axis)
- Start with plot function (or similar)
- Can’t go back once plot has started (i.e. to adjust margins); need to plan in advance

Notes:
1. important parameters:
- pch
- lty
- lwd
- col
- xlab
- ylab

2.

2. lattice
- Plots are created with a single function call (xyplot, bwplot, etc.)
- Things like margins/spacing set automatically because entire plot is specified at once
<pre><code>
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))
<\code><\pre>

3. ggplot2
<pre><code>
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)
<\code><\pre>

### devices:
screen devices
On a Mac the screen device is launched with the quartz()

vector(good for line drawings and plots with solid colors using a modest number
of points): pdf, svg, win.metafile, postscript
bitmap(good for plots with a large number of points, natural scenes or webbased plots): png, jpeg, tiff, bmp

Notes:
1. Functions like plot in base, xyplot in lattice, or qplot in ggplot2 will default to sending a
plot to the screen device
2. The currently active graphics device can be found by calling dev.cur()
3. dev.copy: copy a plot from one device to another; dev.copy2pdf: specifically copy a plot to a PDF file

### 


## base system
### 1_d
1. five-number summary
2. boxplot
<pre><code>
boxplot(pollution$pm25, col = "blue")
abline(h = 12)
<\code><\pre>
3. histogram
<pre><code>
hist(pollution$pm25, col = "green", break=100)
rug(pollution$pm25)

hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)
<\code><\pre>

4. density plot
5. barplot
<pre><code>
barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")
<\code><\pre>
### 2-d
- Use color, size, shape to add dimensions
- Spinning plots

1. Multiple/overlayed 1-D plots (Lattice/ggplot2)
<pre><code>
boxplot(pm25 ~ region, data = pollution, col = "red")

par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))
<\code><\pre>
2. Scatterplots
<pre><code>
par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
<\code><\pre>
3. Smooth scatterplots

## lattice
### package
1. lattice
2. grid

