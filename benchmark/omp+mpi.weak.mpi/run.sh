#!/bin/bash
#SBATCH --job-name="omp+mpi.weak.mpi"
#SBATCH --workdir=.
#SBATCH --output=run-%j.out
#SBATCH --error=run-%j.err
#SBATCH --time=00:15:00
#SBATCH --nodes=16
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --threads-per-core=1

srun --ntasks 1 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-1.xml

srun --ntasks 2 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-2.xml

srun --ntasks 4 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-4.xml

srun --ntasks 8 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-8.xml

srun --ntasks 16 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-16.xml

srun --ntasks 32 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-32.xml

srun --ntasks 64 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-64.xml

srun --ntasks 96 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-96.xml

srun --ntasks 128 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-128.xml