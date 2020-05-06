import example
import numpy
import time

def do_calc_py(arr):

    total = 0
    t1 = time.time()
    for k in arr:
        total = total + k
    print ("Total = ", total)
    t2 = time.time()
    t = t2 - t1
    print("Done in %.20f seconds" % t)

t1 = time.time()
arr = numpy.arange(10000000, dtype=numpy.int)
example.do_calc(arr)
print("Done in %.20f seconds" % (time.time()-t1))

do_calc_py(arr)