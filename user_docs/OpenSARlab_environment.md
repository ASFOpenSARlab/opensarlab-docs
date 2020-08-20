# OpenSARlab Environment
Every OpenSARlab user has access to an Amazon AWS EC2 instance. Individual instances are shared
among groups of 1 - 3 users, depending on demand.

### Operating System
- Ubuntu 18.04

### Volume (storage)
OpenSARlab uses Amazon AWS EBS volume for user storage. After a day without use, a snapshot
of a volume is taken and the volume is destroyed. Upon the next login, a new EBS volume is
created from the snapshot. This can take some time (tens of minutes) and users may notice that
notebooks load slowly during this period. The important takeaway is that user storage is 
persistent; you will not lose saved work.

It is incumbent upon users to manage their storage. Using up all your storage space will 
result in the inability to login to OpenSARlab. Please contact an OpenSARlab administrator
if this occurs.
- 500GB Amazon AWS EBS volume

### Memory (RAM)
As previously mentioned, EC2 instances are shared among users. This happens behind the scenes and is
generally not noticeable when using OpenSARlab, with the exception of memory availability. The amount 
of memory available to each user fluctuates with overall use on an instance, and may vary from 6GB to 16GB.
- 6GB • 16GB 

### Privileges
- Users do not have root privileges (no sudo)

### Installed Software
- alien
- ARIA-tools
- asf-hyp3
- bison
- cartopy
- cdsapi
- cmake
- curl
- cvxopt
- cython
- cython3
- dask
- dask-jobqueue
- environment-modules
- fftw
- flex
- g++
- gcc
- gcc-fortran
- gdal
- gdal-bin
- gfortran-4.8
- GIAnT
- git
- h5py
- hdf4
- hdf5
- hyp3-lib
- ipython
- ISCE
- jupyter_contrib_nbextensions
- libcunit1-dev
- libexif-dev
- libfftw3-dev
- libfreetype6-dev
- libgcc
- libgdal
- libgdal-dev
- libgeos-3.6.2
- libgeos-dev
- libgeotiff-dev
- libgfortran3
- libglade2-dev
- libglib2.0-dev
- libgsl-dev
- libgtk2.0-dev
- libhdf5-dev
- libjpeg-dev
- libopenblas-dev
- libopenjp2-7-dev
- libpng-dev
- libproj-dev
- libproj12
- libshp-dev
- libstdxx-ng
- libtiff5-dev
- libxm4
- libxml2-dev
- lxml
- matplotlib
- MintPy
- netcdf4
- numpy
- opencv
- pkg-config
- proj-bin
- pyaps3
- pykdtree
- pykml
- pyproj
- pyresample
- pytest
- python 2.7.17
- python 3.7.6
- python-distutils-extra
- python-h5py
- python-lxml
- python-matplotlib
- python-mpltoolkits.basemap
- python-netcdf4
- python-numexpr
- python-numpy
- python-pip
- python-pyproj
- python-pyresample
- python-pyshp
- python-pywt
- python-requests
- python-scipy
- python-setuptools
- python-shapely
- python-simplejson
- python2.7-setuptools
- python3-pip
- python3-setuptools
- rsync
- scikit-image
- scipy
- scons
- snap
- snaphu
- TRAIN
- vim
- wget
- yum
- zip
- zlib1g-dev
- zlibc
