import numpy
cimport numpy

ctypedef numpy.int_t INT_t
ctypedef numpy.float64_t FLOAT_t

def do_calc(numpy.ndarray[INT_t, ndim=2] arr1):

    cdef unsigned long int total = 0
    cdef int i, j
    cdef int row, col 
    row = arr1.shape[0]
    col = arr1.shape[1]

    cdef numpy.ndarray[numpy.int_t, ndim=2] arr2
    arr2 = numpy.zeros((row, col), dtype=numpy.int)
    
    for i in range(row):
        for j in range(col): 
            arr2[i][j] = 2 * arr1[i][j]

    return arr2 


def filter_matrix(numpy.ndarray[FLOAT_t, ndim=2] A, double low, double high):
    cdef int row = A.shape[0]
    cdef int col = A.shape[1]
    cdef int i, j
    cdef numpy.ndarray[numpy.int_t, ndim=2] filt 
    filt = numpy.zeros((row, col), dtype=numpy.int)

    for i in range(row):
        for j in range(col):
            if ((A[i][j] > low) and (A[i][j] < high)):
                filt[i][j] = 1
        
    return filt


def find_intersections(numpy.ndarray[INT_t, ndim=2] A, 
                       numpy.ndarray[INT_t, ndim=2] B):
    
    cdef int row_A = A.shape[0]
    cdef int col_A = A.shape[1]
    cdef int row_B = B.shape[0]
    cdef int col_B = B.shape[1]
    cdef int i, j
    cdef numpy.ndarray[numpy.int_t, ndim=2] C 
    C = numpy.zeros((row_A, col_A), dtype=numpy.int)

    if (row_A == row_B) and (col_A == col_B):
        
        for i in range(row_A):
            for j in range(col_A):
                if (A[i][j] == B[i][j]) and (A[i][j] != 0):
                    C[i][j] = 1
        return C
    else:
        print("dimension of arrays do not match.")
        exit(0)



