import cython
from libcpp.string cimport string
from typing import Final


cdef extern from "cppcode/tigerhash.h" namespace "tiger":
    string hash(string value)

class tigerhash(object):

    block_size: Final = 64
    digest_size: Final = 24
    name: Final = "tigerhash"

    def __init__(self, data=b''):
        if hasattr(data, 'decode'):
            self.data = data
            self.hash = hash(data)
        else:
            raise Exception("Incorrect argument")

    def update(self, data):
        if hasattr(data, 'decode'):
            self.data += data
            self.hash = hash(self.data)
        else:
            raise Exception("Incorrect argument")

    def digest(self):
        return bytearray.fromhex(self.hash.decode('utf-8'))

    def hexdigest(self):
        return self.hash.decode('utf-8')

    def copy(self):
        return tigerhash(self.data)
