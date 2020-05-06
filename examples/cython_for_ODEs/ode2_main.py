import sys, time
import numpy as np
import ode2_2 as ode

        
def run(ode_sys, N, nperiods=40):
    I = np.ones(N)
    time_points = np.linspace(0, nperiods * 2 * np.pi, nperiods * 30 + 1)
    u, t = ode.solver(ode_sys, I, time_points, ode.RK2)

run(ode.problem2, 3, 4)