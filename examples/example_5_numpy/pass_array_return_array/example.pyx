import time
import numpy
cimport numpy
cimport libc.stdlib as lib

ctypedef numpy.int_t DTYPE_t
def do_calc(numpy.ndarray[DTYPE_t, ndim=1] arr1):

    cdef int i
    cdef int arr_shape = arr1.shape[0]
    
    cdef numpy.ndarray[numpy.int_t, ndim=1] arr2
    arr2 = numpy.arange(arr_shape, dtype=numpy.int)
    
    #cdef int *arr2 = <int *> lib.malloc(arr_shape * sizeof(int))

    
    for i in range(arr_shape):
       arr2[i] = 2 * arr1[i]
    return arr2

    #try:
    #    for i in range(arr_shape):
    #        arr2[i] = 2 * arr1[i]
    #    return [x for x in arr2[:arr_shape]]
    #finally:
    #    lib.free(arr2)
