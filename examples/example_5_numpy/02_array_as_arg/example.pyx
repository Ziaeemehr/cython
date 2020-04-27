import time
import numpy
cimport numpy

ctypedef numpy.int_t DTYPE_t
def do_calc(numpy.ndarray[DTYPE_t, ndim=1] arr):

    cdef unsigned long int total = 0
    cdef int k 
    cdef double t1, t2, t

    t1 = time.time()

    for k in arr:
        total = total + k
    print "Total = ", total

    t2 = time.time()
    t = t2 - t1
    print("Done in %.20f seconds" % t)