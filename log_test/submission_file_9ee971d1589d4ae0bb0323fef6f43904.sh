#!/bin/bash

# Parameters
#SBATCH --cpus-per-task=10
#SBATCH --error=/data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test/%j_0_log.err
#SBATCH --gpus-per-node=1
#SBATCH --job-name=submitit
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --open-mode=append
#SBATCH --output=/data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test/%j_0_log.out
#SBATCH --partition=a100
#SBATCH --signal=USR1@120
#SBATCH --time=5
#SBATCH --wckey=submitit

# command
export SUBMITIT_EXECUTOR=slurm
srun --unbuffered --output /data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test/%j_%t_log.out --error /data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test/%j_%t_log.err /data/home/pingyu/miniconda3/envs/upsampler/bin/python -u -m submitit.core._submit /data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test
