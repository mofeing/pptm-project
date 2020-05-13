#!/bin/bash
#SBATCH --job-name="bench.base.omp+mpi.strong.mpi"
#SBATCH --workdir=.
#SBATCH --output=run-%j.out
#SBATCH --error=run-%j.err
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=48
#SBATCH --cpus-per-task=1
#SBATCH --threads-per-core=1

srun -n 1 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-1.xml

srun -n 2 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 48
mv info_2_2_2.xml time-222-2.xml

srun -n 4 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 24
mv info_2_2_2.xml time-222-4.xml

srun -n 8 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 12
mv info_2_2_2.xml time-222-8.xml

srun -n 16 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 6
mv info_2_2_2.xml time-222-16.xml

srun -n 24 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 4
mv info_2_2_2.xml time-222-24.xml

srun -n 32 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 3
mv info_2_2_2.xml time-222-32.xml

srun -n 48 $HOME/project/miniqmc/build/OMP+MPI/bin/miniqmc -g "2 2 2" -w 2
mv info_2_2_2.xml time-222-48.xml
