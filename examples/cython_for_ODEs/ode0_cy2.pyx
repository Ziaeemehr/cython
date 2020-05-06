"""
ODE integration restricted to scalar ODEs.
No use of arrays.
Cython version with declaration of variables.
"""

cpdef solver(f, double I, double dt, double T, method):
    cdef int N = int(round(float(T)/dt))
    cdef double u = I  # previous time step
    cdef double t = 0
    cdef int n
    for n in xrange(N):
        u = method(u, t, f, dt)
        t += dt
    return u, t

cpdef double RK2(double u, double t, f, double dt) except -10001:
    cdef double K1, K2, unew
    K1 = dt*f(u, t)
    K2 = dt*f(u + 0.5*K1, t + 0.5*dt)
    unew = u + K2
    return unew

cpdef double problem1(double u, double t) except -10001:
    return -u +1  # u = 1-exp(-t)







