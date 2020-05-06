import numpy as np
cimport numpy as np
cimport cython
ctypedef np.float_t DT

cdef extern from "math.h":
    double exp(double)

cdef class Problem:
    cpdef rhs(self, np.ndarray[DT, ndim=1, negative_indices=False, mode='c'] u, 
                     double t):

        return 0

cdef class Problem1(Problem):
    cpdef rhs(self, np.ndarray[DT, ndim=1, negative_indices=False, mode='c'] u, 
                     double t):
        return -u + 1.0 

cdef class Problem2(Problem):
    cpdef rhs(self, np.ndarray[DT, ndim=1, negative_indices=False, mode='c'] u, 
                     double t):
        return - u + exp(-2 * t)

cdef class ODEMethod:
    cpdef advance(self, np.ndarray[DT, ndim=1, negative_indices=False, mode='c'] u, 
                  double t, double dt, int n, Problem ode_sys):
        return 0

cdef class Method_RK2(ODEMethod):
    cpdef advance(self, np.ndarray[DT, ndim=1, negative_indices=False, mode='c'] u, 
                  double t, double dt, int n, Problem ode_sys):
        
        cdef np.ndarray[DT, ndim=1, negative_indices=False, mode='c'] K1, K2, unew
        
        K1 = dt * ode_sys.rhs(u, t)
        K2 = dt * ode_sys.rhs(u + 0.5 * K1, t + 0.5 * dt)
        unew = u + K2
        return unew
    
# Create names compatible with ode1.py
RK2 = Method_RK2()
problem1 = Problem1()
problem2 = Problem2()

@cython.boundscheck(False) # turn off bounds checking for this func.
@cython.wraparound(False)  # Deactivate negative indexing.
def solver(Problem ode_sys, 
           np.ndarray[DT, ndim=1, mode='c', negative_indices=False] I, 
           np.ndarray[DT, ndim=1, mode='c', negative_indices=False] t, 
           ODEMethod method):
    
    cdef int N = len(t)-1
    #cdef np.ndarray[DT, ndim=1, negative_indices=False, mode='c'] u = np.zeros(N+1, dtype=np.float_t)
    #Cython does not like type specification via dtype when the buffer
    #declares the type
    cdef np.ndarray[DT, ndim=2, negative_indices=False, 
                    mode='c'] u = np.zeros((N+1, len(I)))
    u[0, :] = I   
    dt = t[1] - t[0]
             
    cdef int n
    for n in range(N):
        u[n+1, :] = method.advance(u[n, :], t[n], dt, n, ode_sys)
    
    return u, t
