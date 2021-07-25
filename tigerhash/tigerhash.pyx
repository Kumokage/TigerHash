import cython
from libcpp.string cimport string

cdef extern from "cppcode/tigerhash.h" namespace "tiger":
    string hash(string value)

class tigerhash(object):

    def __init__(data=b''):
        if hasattr(data, decode):
            self.data = data
            self.hash = hash(data)
        else:
            raise Exception("Incorrect argument")

    def update(data):
        if hasattr(data, decode):
            self.data += data
            self.hash = hash(data)
        else:
            raise Exception("Incorrect argument")

    def digest():
        return bytearray.fromhex(self.hash)

    def hexdigest():
        return self.hash

    def copy():
        return tigerhash(self.data)

    def name():
        return "tigerhash"

    def block_size():
        return 64

    def digest_size():
        return 24