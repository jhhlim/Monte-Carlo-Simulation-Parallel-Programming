#!/bin/bash
#SBATCH -J MonteCarlo
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o montecarlo.out
#SBATCH -e montecarlo.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=limjas@oregonstate.edu
for t in 16 32 64 128
do
    for j in 16384 32768 65536 131072 262144 524288 1024000
    do
        /usr/local/apps/cuda/cuda-10.1/bin/nvcc -DBLOCKSIZE=$t -DNUMTRIALS=$j -o proj5 montecarloTemplate.cu
        ./proj5
    done
    echo
done
echo
