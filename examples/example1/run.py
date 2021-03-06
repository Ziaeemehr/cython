import example_cy
import timeit

# example_cy.test(5)

cy = timeit.timeit('''example_cy.test(5000)''',
            setup="import example_cy", number=100)
py = timeit.timeit('''example_py.test(5000)''',
            setup="import example_py", number=100)

# print(cy, py)
print('Cython is {}x faster'.format(py/cy))
