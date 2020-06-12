#!/bin/bash
#SBATCH --job-name="bench.ch2.omp.weak"
#SBATCH --workdir=.
#SBATCH --output=run-%j.out
#SBATCH --error=run-%j.err
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH --threads-per-core=1

OMP_NUM_THREADS=1 $HOME/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2" -w 2
mv info_2_2_2.xml time-222-1.xml

OMP_NUM_THREADS=2 $HOME/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2" -w 4
mv info_2_2_2.xml time-222-2.xml

OMP_NUM_THREADS=4 $HOME/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2" -w 8
mv info_2_2_2.xml time-222-4.xml

OMP_NUM_THREADS=8 $HOME/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2" -w 16
mv info_2_2_2.xml time-222-8.xml

OMP_NUM_THREADS=16 $HOME/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2" -w 32
mv info_2_2_2.xml time-222-16.xml

OMP_NUM_THREADS=24 $HOME/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2" -w 48
mv info_2_2_2.xml time-222-24.xml

OMP_NUM_THREADS=32 $HOME/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2" -w 64
mv info_2_2_2.xml time-222-32.xml

OMP_NUM_THREADS=48 $HOME/project/miniqmc/build/omp/bin/miniqmc -g "2 2 2" -w 96
mv info_2_2_2.xml time-222-48.xml

