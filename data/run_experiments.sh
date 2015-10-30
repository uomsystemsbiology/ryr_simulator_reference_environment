#!/bin/sh

# Set up logfile
log=/home/sbl/run_experiments.log

echo;echo;echo
echo "### Overview
This shell script is part of the reference environment for the manuscript ['Effects of Heterogeneous Organization of RyR Clusters, Myofibrils and Mitochondria on Ca 2+ Release Patterns in Cardiomyocytes'](http://dx.doi.org/10.1371/journal.pcbi.1004417).  
It executes code to reproduce specific results described in the manuscript.   You can find more information about this research at the [project page here](https://github.com/vraj004/RyR-simulator)  

To find other versions of this reference environment, see Other Links below.  To learn more about reference environments, [see the detailed description here](http://uomsystemsbiology.github.io/reference-environments/).

### Instructions for use

This shell script reproduces results described in the manuscript, writes 
output to /home/sbl/ryr-simulator/output-files and produces a 3d plot of RyR distributions.

### Other links

[Manuscript link](http://dx.doi.org/10.1371/journal.pcbi.1004417)

[Project page link](https://github.com/vraj004/RyR-simulator)

[Bootable ISO](http://dx.doi.org/10.5281/zenodo.32916)

[Vagrant-managed virtual machine](https://github.com/uomsystemsbiology/ryr_simulator_reference_environment)"
echo

# Change to project directory
cd ~/ryr-simulator/source

Rscript ryr-simulator.R

echo Completed analysis | tee -a $log
echo;echo



$SHELL