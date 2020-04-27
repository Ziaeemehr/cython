cimport libc.stdlib as lib

def do_calc(x):
    cdef size_t n = len(x)
    cdef int* data = <int*>lib.malloc(n * sizeof(int))
    cdef int i 
    try:
        for i in range(n):
            data[i] = 2 * x[i]
        return [x for x in data[:n]]
    finally:
        lib.free(data)
    
    return data
