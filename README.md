[![Build Status](https://travis-ci.org/esa-esdl/gridtools-conda.svg?branch=master)](https://travis-ci.org/esa-esdl/gridtools-conda)


# gridtools-conda

This repository provides scripts used to build and deploy various 
[gridtools](https://github.com/esa-esdl/gridtools) packages
for the [Anaconda](https://www.continuum.io/) and
[Miniconda](https://conda.io/miniconda.html) Python distributions.
 

## Building gridtools Conda packages

Install `conda-build` in your **root** Miniconda:

    $ source activate
    $ conda install conda-build
    
Clone this repo:
    
    $ git clone https://github.com/esa-esdl/gridtools-conda
    
Build a Conda package `gridtools` (see `recipes/gridtools/meta.yaml`):
    
    $ cd gridtools-conda
    $ conda build -c conda-forge -c defaults recipes/gridtools
     
The `-c` (or `--channel`) option adds extra Anaconda *channels* to search for package 
dependencies. We must add `defaults` to search for Anaconda default packagers first, then
for packages from `conda-forge`, which hosts the `cartopy` versions required by Cate.

## Testing the Conda package

To test the new Conda package `gridtools` in a test environment `gridtools-test`, type
     
    $ conda create -n gridtools-test python=3
    $ source activate gridtools-test
    $ conda install -c conda-forge --use-local gridtools

## Deploying the Conda package

Just run the package build step with `--user <channel>`:

    $ conda build --user ccitools -c conda-forge -c defaults recipes/gridtools
