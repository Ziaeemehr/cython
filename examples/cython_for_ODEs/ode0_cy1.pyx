"""
ODE integration restricted to scalar ODEs.
No use of arrays.
Just plain Python code compiled as Cython.
"""

def solver(f, I, dt, T, method):
    N = int(round(float(T)/dt))
    u = I  # previous time step (initial condition)
    t = 0
    for n in range(N):
        u = method(u, t, f, dt)
        t += dt
    return u, t

def RK2(u, t, f, dt):
    K1 = dt*f(u, t)
    K2 = dt*f(u + 0.5*K1, t + 0.5*dt)
    unew = u + K2
    return unew
    
from math import exp

def problem(u, t):
    return - u + exp(-2*t)
