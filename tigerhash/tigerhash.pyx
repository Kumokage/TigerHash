import cython
from libcpp.string cimport string

cdef extern from "cppcode/tigerhash.h" namespace "tiger":
    string hash(string value)

def tigerhash(value):
    return hash(value)