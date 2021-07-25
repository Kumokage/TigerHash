from setuptools import find_packages, setup
from Cython.Build import cythonize

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setup(
    name='tigerhash',
    version='0.2.0',
    description='Implementation of tiger hash in C++ with Python API. ',
    long_description=long_description,
    long_description_content_type="text/markdown",
    author='Alex Glushko',
    author_email='aglushko@hse.ru',
    url='https://github.com/Badcat330/TigerHash',
    classifiers=[
        "Programming Language :: Cython",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
        "Development Status :: 1 - Planning"
    ],
    package_dir={"": "tigerhash"},
    packages=find_packages(where="tigerhash"),
    python_requires=">=3.9",
    install_requires=['cython'],
    setup_requires=['pytest-runner'],
    tests_require=['pytest==4.4.1'],
    test_suite='tests',
    ext_modules=cythonize("tigerhash/tigerhash.pyx", language="c++"),
)
