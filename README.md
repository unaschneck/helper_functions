# helper_functions

To automatically add all helper functions whenever MATLAB script is initialized, create a [setup.m function](https://www.youtube.com/watch?v=HhuA_kWQaK0&t=606) with addpath(location/of/helper_functions)

## 1. cleanstart(): 

Runs clc, clear, close all

ex.
```
x = 1:10;
y = x.^2;
h1 = plot(x,y)
cleanstart() % <-- closes everything and starts fresh
```

## 2. figT(filename): 

Specify title, figure handle, and tab label with same name

ex.
```
x = 1:10
y = x.^2
h1 = figT('plotXY');
```

## 3. print_fig(save_location):

Saves all open figures to .svg and .pdf files with name. Defaults to current working directory. 

Dependancy: plot2Latex (https://github.com/Don-Chris/Plot2LaTeX)

ex.
```
x = 1:10
y = x.^2
h1 = figT('plotXY');
plot_fig() % <-- makes plotXY.pdf and plotXY.svg files in current working directory 
```
