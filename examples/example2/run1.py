#cython: language_level=3
import pyximport; pyximport.install()
import example
print(example.fib(2000))





'''
pyximport: Cython Compilation for Developers
If your module doesn’t require any extra C libraries or a special build setup, then you can use the pyximport module, originally developed by Paul Prescod, to load .pyx files directly on import, without having to run your setup.py file each time you change your code. It is shipped and installed with Cython and can be used like this:
'''
