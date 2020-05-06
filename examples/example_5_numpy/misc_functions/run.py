import numpy
import timeit
import example
from time import time

def do_calc_py(arr1):

    row, col = arr1.shape
    arr2 = numpy.zeros((row, col), dtype=numpy.int)
    
    for i in range(row):
        for j in range(col): 
            arr2[i][j] = 2 * arr1[i][j]

    return arr2
    

def filter_matrix_py(A, low, high):

    row, col = A.shape
    filt = numpy.zeros((row, col), dtype=numpy.int)

    for i in range(row):
        for j in range(col):
            if ((A[i][j] > low) and (A[i][j] < high)):
                filt[i][j] = 1
        
    return filt


def find_intersections_py(A, B):

    row_A, col_A = A.shape
    row_B, col_B = B.shape

    if (row_A == row_B) and (col_A == col_B):

        condition = (A == B) & (A != 0)
        condition = condition.astype(numpy.int)
        
        # for i in range(row_A):
        #     for j in range(col_A):
        #         if (A[i][j] == B[i][j]) and (A[i][j] != 0):
        #             C[i][j] = 1
        return condition
    else:
        print("dimension of arrays do not match.")
        exit(0)



if __name__ == "__main__":

    N = 20
    arr1 = numpy.ones((N, N), dtype=numpy.int)
    t1 = time()
    arr2 = example.do_calc(arr1)
    print("cy done in : ", (time() - t1))

    t1 = time()
    arr3 = do_calc_py(arr1)
    print("py done in : ", (time() - t1))
    print("arr2 is equal arr3 : ", numpy.array_equal(arr2, arr3))


    numpy.set_printoptions(formatter={'float': lambda x: "{0:0.1f}".format(x)})

    print("=" * 70)

    numpy.random.seed(1)
    N =  2000
    A = numpy.random.rand(N, N) * 10
    # print(A)

    t1 = time()
    filt_cy = example.filter_matrix(A, 2, 5)
    print("cy done in : ", (time() - t1))
    # print(filt_cy)

    t1 = time()
    filt_py = filter_matrix_py(A, 2, 5)
    print("py done in : ", (time() - t1))

    t1 = time()
    cond = (A > 2) & (A < 5)
    cond  = cond.astype(numpy.int)
    print("condition done in : ", (time() - t1))
    print("filt_cy is equal filt_where : ", numpy.array_equal(filt_cy, cond))
    print("filt_cy is equal filt_py : ", numpy.array_equal(filt_cy, filt_py))

    print("=" * 70)
    A = numpy.random.randint(0, 2, size=(N, N))
    B = numpy.random.randint(0, 2, size=(N, N))
    # print("A\n", A)
    # print("B\n", B)
    t1 = time()
    C_cy = example.find_intersections(A, B)
    print("find intersec done in : ", (time() - t1))

    t1 = time()
    C_py =find_intersections_py(A, B)
    print("find intersec py done in : ", (time() - t1))

    # print("C_cy\n", C_cy)
    # print("C_py\n", C_py)
    
    print("C_cy is equal C_py : ", numpy.array_equal(C_cy, C_py))



