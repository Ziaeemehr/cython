-  [Reference](http://hplgit.github.io/teamods/cyode/cyode-sphinx/main_cyode.html)
- [github of reference](https://github.com/hplgit/INF5620/tree/gh-pages/src/cyode)

#### Usage:

```sh
$ python3 ode0_main.py 0  # zero means run pure python code for problem 
# CPU-time, pure Python, ode1.py: 0.545552 s


# Usage: setup.py problem version
python3 setup.py 0 1 build_ext --inplace 
python3 ode0_main.py 1   # runs ode0_cy1.py in Cython
# Imported ode0_cy1
# CPU-time, Cython, ode0_cy1.py: 0.332846 s

python3 setup.py 0 2 build_ext --inplace 
python3 ode0_main.py 2
# Imported ode0_cy2
# CPU-time, Cython, ode0_cy2.py: 0.288343 s

python3 setup.py 0 3 build_ext --inplace 
python3 ode0_main.py 3
# Imported ode0_cy3
# CPU-time, Cython, ode0_cy3.py: 0.015382 s

python3 setup.py 0 4 build_ext --inplace 
python3 ode0_main.py 4                   
# Imported ode0_cy4
# CPU-time, Cython, ode0_cy4.py: 0.023059 s

python3 setup.py 0 5 build_ext --inplace 
python3 ode0_main.py 5                   
# Imported ode0_cy5
# CPU-time, Cython, ode0_cy5.py: 0.021989 s

python3 setup.py 0 6 build_ext --inplace  # using exp from python math
python3 ode0_main.py 6 100000000 2  
# Imported ode0_cy6
# CPU-time, Cython, ode0_cy6.py: 11.899251 s

# commented the line : from math import exp
# and uncommented next two lines 
python3 setup.py 0 6 build_ext --inplace  # using exp from math.h 
python3 ode0_main.py 6 100000000 2  
# Imported ode0_cy6
# CPU-time, Cython, ode0_cy6.py: 3.096997 s

