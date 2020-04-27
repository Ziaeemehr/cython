
import time
import numpy
cimport numpy
cimport cython 

ctypedef numpy.int_t DTYPE_t

@cython.boundscheck(False)
@cython.wraparound(False)
def do_calc(numpy.ndarray[DTYPE_t, ndim=1] arr):

    cdef unsigned long int total = 0
    cdef int k 
    cdef double t1, t2, t
    cdef int arr_shape = arr.shape[0]

    t1 = time.time()

    for k in range(arr_shape):
        total = total + arr[k]
    print "Total = ", total

    t2 = time.time()
    t = t2 - t1
    print("Done in %.20f seconds" % t)