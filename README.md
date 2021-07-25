# TigerHash [![PyPI version](https://badge.fury.io/py/tigerhash.svg)](https://badge.fury.io/py/tigerhash) [![test](https://github.com/Badcat330/TigerHash/actions/workflows/test.yml/badge.svg)](https://github.com/Badcat330/TigerHash/actions/workflows/test.yml)[![Downloads](https://pepy.tech/badge/tigerhash)](https://pepy.tech/project/tigerhash)

Implementation of tiger hash in C++ with Python API. 
The basic API matches that of Python's standard [`hashlib`](https://docs.python.org/3/library/hashlib.html) module. 

## Creators

The algorithm was created by [Ross Anderson and Eli Biham](https://www.cl.cam.ac.uk/~rja14/Papers/tiger.pdf). 
It was designed to be a fast, secure hash function which was created for being faster then RIPE-MD, MD5, SHA, SHA1 and Snefru-8 on 64-bit processors.

## Installation

```
pip install tigerhash
```

As usual with Pip, you might need to use `sudo` or the `--user` flag
with the command above, depending on how you installed Python on your
system.