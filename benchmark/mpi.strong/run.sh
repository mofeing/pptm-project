#!/bin/bash
#SBATCH --job-name="mpi.strong"
#SBATCH --workdir=.
#SBATCH --output=run-%j.out
#SBATCH --error=run-%j.err
#SBATCH --time=02:00:00
#SBATCH --nodes=16
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --threads-per-core=1

srun --ntasks 8 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-8.xml

srun --ntasks 16 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 48
mv info_2_2_2.xml time-222-16.xml

srun --ntasks 32 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 24
mv info_2_2_2.xml time-222-32.xml

srun --ntasks 64 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 12
mv info_2_2_2.xml time-222-64.xml

srun --ntasks 128 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 6
mv info_2_2_2.xml time-222-128.xml

srun --ntasks 256 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 3
mv info_2_2_2.xml time-222-256.xml

srun --ntasks 384 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 2
mv info_2_2_2.xml time-222-384.xml

srun --ntasks 768 /home/pptm71/pptm71019/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 1
mv info_2_2_2.xml time-222-768.xml