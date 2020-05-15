#!/bin/bash
#SBATCH --job-name=trace.base.mpi.1
#SBATCH --workdir=.
#SBATCH --output=job.out
#SBATCH --error=job.err
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --threads-per-core=1
srun ./trace.sh
