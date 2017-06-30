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
