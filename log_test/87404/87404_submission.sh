#!/bin/bash

# Parameters
#SBATCH --error=/data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test/%j/%j_0_log.err
#SBATCH --job-name=submitit
#SBATCH --nodes=1
#SBATCH --open-mode=append
#SBATCH --output=/data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test/%j/%j_0_log.out
#SBATCH --partition=learnfair
#SBATCH --signal=USR1@90
#SBATCH --time=4
#SBATCH --wckey=submitit

# command
export SUBMITIT_EXECUTOR=slurm
srun --unbuffered --output /data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test/%j/%j_%t_log.out --error /data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test/%j/%j_%t_log.err /data/home/pingyu/miniconda3/envs/upsampler/bin/python -u -m submitit.core._submit /data/home/pingyu/upsampler/Image-Super-Resolution-via-Iterative-Refinement/log_test/%j
