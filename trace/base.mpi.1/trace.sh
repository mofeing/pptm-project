#!/bin/bash
source ${EXTRAE_HOME}/etc/extrae.sh
export EXTRAE_CONFIG_FILE=extrae.xml
export LD_PRELOAD=${EXTRAE_HOME}/lib/libompitrace.so
${HOME}/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
