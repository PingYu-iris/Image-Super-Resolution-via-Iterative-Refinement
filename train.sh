#!/bin/bash
#SBATCH --job-name=train10
#SBATCH --partition=learnaccel
#SBATCH --gpus-per-node=8
#SBATCH --nodes=1
#SBATCH --time=3-00:00:00 # run for one day
#SBATCH --cpus-per-task=10
## %j is the job id, %u is the user id
#SBATCH --output=/data/home/%u/upsampler/logs/train10-%j.log

conda activate upsampler
cat /etc/hosts
python sr.py -p train -c config/train10.json