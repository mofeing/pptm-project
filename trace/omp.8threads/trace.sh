#!/bin/bash
#SBATCH --job-name=trace.omp.8
#SBATCH --workdir=.
#SBATCH --output=job.out
#SBATCH --error=job.err
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --threads-per-core=1

source ${EXTRAE_HOME}/etc/extrae.sh
export EXTRAE_CONFIG_FILE=extrae.xml
export LD_PRELOAD=${EXTRAE_HOME}/lib/libompitrace.so
export OMP_NUM_THREADS=8
export OMP_MAX_ACTIVE_LEVELS=1
${HOME}/project/miniqmc/build/OMP/bin/miniqmc -g "2 2 2"
