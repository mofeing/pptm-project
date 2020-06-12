#!/bin/bash
#SBATCH --job-name=trace-base.omp.8
#SBATCH --workdir=.
#SBATCH --output=prof.out
#SBATCH --error=prof.err
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --threads-per-core=1

amplxe-cl -collect hotspots -r hotspots ${HOME}/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2"
amplxe-cl -collect hpc-performance -r hpc ${HOME}/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2"
