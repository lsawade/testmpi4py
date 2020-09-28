#!/bin/bash
#SBATCH --job-name=test_mpi
#SBATCH --output=./mpiout.txt
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=30
# SBATCH --gres=gpu:3
# SBATCH --mem=200GB
#SBATCH --time=00:01:00
# SBATCH --reservation=test
# SBATCH --mail-user=lsawade@princeton.edu
# SBATCH --mail-type=END


module load anaconda3
module load openmpi/gcc

./test_master.py
