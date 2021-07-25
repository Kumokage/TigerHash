"""
Tiger Hash
---------
Python API for tigerhash implemented in C++.
Hash function crated by Ross Anderson and Eli Biham 
    https://www.cl.cam.ac.uk/~rja14/Papers/tiger.pdf
"""

__all__ = ["tigerhash"]

import cython
from libcpp.string cimport string
from typing import Final


cdef extern from "cppcode/tigerhash.h" namespace "tiger":
    """ C++ hash function mapping """
    string hash(string value)

class tigerhash(object):
    """
    A class for computing tigerhash

    Attributes
    ----------
    block_size : int
        The internal block size of the hash algorithm in bytes.
    digest_size : int
        The size of the resulting hash in bytes.
    name : str
        The canonical name of this hash lowercase.
    Methods
    -------
    update(data)
        Update the hash object with the bytes-like object. 
        Repeated calls are equivalent to a single call with the concatenation 
        of all the arguments: m.update(a); m.update(b) is equivalent to m.update(a+b).
    digest()
        Return the digest of the data passed to the update() method so far. 
        This is a bytes object of size digest_size which may contain bytes 
        in the whole range from 0 to 255.
    hexdigest()
        Like digest() except the digest is returned as a string object of 
        double length, containing only hexadecimal digits. This may be used 
        to exchange the value safely in email or other non-binary environments.
    copy()
        Return a copy (“clone”) of the hash object. This can be used to efficiently 
        compute the digests of data sharing a common initial substring.
    """

    block_size: Final = 64
    digest_size: Final = 24
    name: Final = "tigerhash"

    def __init__(self, data=b''):
        """
        Parameters
        ----------
        data : bytes-like object
            data for hashing (default is b'')
        """
        if hasattr(data, 'decode'):
            self.data = data
            self.hash = hash(data)
        else:
            raise Exception("Incorrect argument")

    def update(self, data):
        """ Update self.data and recompute hash
        Parameters
        ----------
        data : bytes-like object
            data for updating current data
        """
        if hasattr(data, 'decode'):
            self.data += data
            self.hash = hash(self.data)
        else:
            raise Exception("Incorrect argument")

    def digest(self):
        """ Convert hash from c++ algorithem into bytearray object
        Returns
        ----------
        hash : bytearray
            resulting hash in bytes formate
        """
        return bytearray.fromhex(self.hash.decode('utf-8'))

    def hexdigest(self):
        """ Convert hash from c++ algorithem into hex string
        Returns
        ----------
        hash : str
            resulting hash in hex formate
        """
        return self.hash.decode('utf-8')

    def copy(self):
        """ Copy object
        Returns
        ----------
        hash : tigerhash
            return copy of object
        """
        return tigerhash(self.data)
