import time
import numpy
cimport numpy



def func(unsigned long int maxval):

    cdef unsigned long int total = 0
    cdef int k 
    cdef double t1, t2, t
    cdef numpy.ndarray[numpy.int_t, ndim=1] arr

    arr = numpy.arange(maxval, dtype=numpy.int)

    t1 = time.time()

    for k in arr:
        total = total + k
    print "Total = ", total

    t2 = time.time()
    t = t2 - t1
    print("Done in %.20f seconds" % t)