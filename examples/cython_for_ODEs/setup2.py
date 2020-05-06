from distutils.core import setup
from Cython.Build import cythonize

setup(ext_modules=cythonize("ode2_2.pyx", annotate=True))
