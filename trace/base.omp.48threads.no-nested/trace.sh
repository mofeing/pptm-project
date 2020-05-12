#!/bin/bash
#SBATCH --job-name=trace.base.omp.48.no-nested
#SBATCH --workdir=.
#SBATCH --output=job.out
#SBATCH --error=job.err
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH --threads-per-core=1

source ${EXTRAE_HOME}/etc/extrae.sh
export EXTRAE_CONFIG_FILE=extrae.xml
export LD_PRELOAD=${EXTRAE_HOME}/lib/libomptrace.so
${HOME}/project/miniqmc/build/OMP/bin/miniqmc -g "2 2 2"
