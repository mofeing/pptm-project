#!/bin/bash
#SBATCH --job-name="omp.weak"
#SBATCH --workdir=.
#SBATCH --output=run-%j.out
#SBATCH --error=run-%j.err
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH --threads-per-core=1

OMP_NUM_THREADS=1 /home/pptm71/pptm71019/miniqmc/build/OMP/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-1.xml

OMP_NUM_THREADS=2 /home/pptm71/pptm71019/miniqmc/build/OMP/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-2.xml

OMP_NUM_THREADS=4 /home/pptm71/pptm71019/miniqmc/build/OMP/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-4.xml

OMP_NUM_THREADS=8 /home/pptm71/pptm71019/miniqmc/build/OMP/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-8.xml

OMP_NUM_THREADS=16 /home/pptm71/pptm71019/miniqmc/build/OMP/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-16.xml

OMP_NUM_THREADS=24 /home/pptm71/pptm71019/miniqmc/build/OMP/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-24.xml

OMP_NUM_THREADS=48 /home/pptm71/pptm71019/miniqmc/build/OMP/bin/miniqmc -g "2 2 2"
mv info_2_2_2.xml time-222-48.xml

