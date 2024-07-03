#!/bin/bash
#SBATCH --ntasks=[NTASKS]
#SBATCH --partition=[PARTITION/QUEUE]
#SBATCH --time=[DAYS]-[HOURS]:[MINUTES]:[SECONDS]
#SBATCH --account=[DEPTCODE]
#SBATCH --job-name=[JOBNAME]
#SBATCH --mail-user=[USERNAME]@memphis.edu
#SBATCH --output=[STDOUT]-%j.out
#SBATCH --error=[STDERR]-%j.err
#SBATCH --mem-per-cpu=[MEMORY_NEEDED_PER_CPU]
 
#################################################
# [SOMETHING]                                   #
#-----------------------------------------------#
# Please replace anything in [] brackes with    #
# what you want.                                #
# Example:                                      #
# #SBATCH --partition=[PARTITION/QUEUE]         #
# Becomes:                                      #
# #SBATCH --partition=acomputeq                 #
#################################################

#################################################
# --ntasks=[NTASKS]                             #
#-----------------------------------------------#
# Number of threads your job will need. For     #
# normal multithreaded jobs, 'ulimit -T' will   #
# limit the number of threads you can run at    #
# once. For openMP jobs, OMP_NUM_THREADS will   #
# limit the number of threads your openMP job   #
# will need.                                    #
#################################################
ulimit -T $SLURM_NTASKS
export OMP_NUM_THREADS=$SLURM_NTASKS

#################################################
# --partition=[PARTITION/QUEUE]                 #
#-----------------------------------------------#
# computeq: 40 cores, 192 GB mem                #
# bigmemq: 40 cores, 768-1536 GB mem            #
# gpuq: 40 cores, 192 GB mem, 2 v100 GPUs       #
#################################################

# Go to submission directory.
cd $SLURM_SUBMIT_DIR
 
# Load some modules.
#module load [MODULE]

# What is my job ID?
echo "$SLURM_JOB_ID"

#################################################
# Run your executable here                      #
#################################################
#[EXECUTABLE] [OPTIONS]
