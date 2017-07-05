# Gmtmex - GMT API for MATLAB

# Introduction

The GMT MATLAB interface makes it possible to access all GMT modules from MATLAB. Users of MATLAB can write MATLAB scripts
that call upon GMT modules to do any of the things GMT normally can do, and return the results (grids, data-tables, CPTs,
text-files, and even final images via psconvert) to MATLAB variables. MATLAB matrices can be given as input to GMT modules.
Examples below will give you the general idea.

# Installing

## Windows

The Windows installers come already with the gmtmex.mexw64|32 and gmt.m files necessary run the MEX. Only make sure that the
GMT5.3 binary dir is either in the Windows path (the installer does that for you) and in the MATLAB path (you have to do it
yourself). If you want to (re)build the MEX file yourself, see the compile_mex.bat in the source SVN repository.

## OS X

We have successfully built the MATLAB interface under OS X. However, due to the way MATLAB handles shared libraries it is a
delicate process, with several caveats. This may change over time as we work with MathWorks to straighten out the kinks.
The following works:

 * Install the GMT OS X Bundle
 * Run the gmt_prepmex.sh script in the bundle's share/tools directory.  This will duplicate
   the GMT 5.3 installation into /opt/gmt and re-baptize all the shared libraries.
 * Use gmtswitch to make /opt/gmt the current active GMT version
 * Checkout the gmt-mex project via subversion into some directory, i.e.,
   svn checkout svn://gmtserver.soest.hawaii.edu/gmt-mex gmt-mex
 * In gmt-mex/trunk, run autoconf then configure --enable-matlab (and maybe --enable-debug) is you
   can help debug things.
 * Run make which builds the gmtmex.mexmaci64.  This executable is accessed by the gmt.m script.
 * Set your MATLAB path so these two can be found (or copy them to a suitable directory).
 * Make sure your gmt.conf file has the entry GMT_CUSTOM_LIBS=/opt/gmt/lib/gmt/plugins/supplements.so.

You can also build your own bundle (see CMakeLists.txt in main GMT directory).  The above works
with UNIX installations from fink or HomeBrew but fails for us if under MacPorts (then, MATLAB
will complain about wrong shared HDF5 library and we crash).
If you wish to help debug in XCode then see the gmt-mex wiki for more details.  While the latest
2016a MATLAB version works with XCode 7, earlier versions may require 6.4 and you will have 
to install the older Xcode version.
We used the 2016b MATLAB version to build the interface but 2015a,b should also work.  Older
versions may also work but we have not attempted this since we only have access to these three.

## Unix/Linux

Preliminary experiments indicate we will have to fight the shared library dilemma here as well.
Volunteers on Linux wishing to run the GMT MATLAB interface are needed to make progress.

# Using

The MATLAB wrapper was designed to work in a way the closest as possible to the command line version
and yet to provide all the facilities of the MATLAB IDE (the ML command line desktop). In this sense,
all **GMT** options are put in a single text string that is passed, plus the data itself when it applies,
to the ``gmt()`` command. For example to reproduce the CookBook example of an Hemisphere map using a
Azimuthal projection


