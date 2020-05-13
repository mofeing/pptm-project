#!/bin/bash
#SBATCH --job-name="bench.base.omp+mpi.strong.omp"
#SBATCH --workdir=.
#SBATCH --output=run-%j.out
#SBATCH --error=run-%j.err
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=48
#SBATCH --threads-per-core=1

srun --cpus-per-task=1 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-1.xml

srun --cpus-per-task=2 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-2.xml

srun --cpus-per-task=4 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-4.xml

srun --cpus-per-task=8 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-8.xml

srun --cpus-per-task=16 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-16.xml

srun --cpus-per-task=24 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-24.xml

srun --cpus-per-task=32 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-32.xml

srun --cpus-per-task=48 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-48.xml
