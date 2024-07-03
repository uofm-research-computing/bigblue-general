#!/bin/bash
#SBATCH --ntasks=[NTASKS]
#SBATCH --partition=agpuq
#SBATCH --time=[DAYS]-[HOURS]:[MINUTES]:[SECONDS]
#SBATCH --account=[DEPTCODE]
#SBATCH --job-name=[JOBNAME]
#SBATCH --mail-user=[USERNAME]@memphis.edu
#SBATCH --output=[STDOUT]-%j.out
#SBATCH --error=[STDERR]-%j.err
#SBATCH --mem=[MEMORY_NEEDED_FOR_JOB]

#################################################
# [SOMETHING]                                   #
#-----------------------------------------------#
# Please replace anything in [] brackes with    #
# what you want.                                #
# Example:                                      #
# #SBATCH --partition=[PARTITION/QUEUE]         #
# Becomes:                                      #
# #SBATCH --partition=agpuq                     #
#################################################

#################################################
# --partition=[PARTITION/QUEUE]                 #
#-----------------------------------------------#
# For this script we are assuming:              #
#   gpuq: 40 cores, 192 GB mem, 2 v100 GPUs     #
#################################################

#################################################
# --ntasks=[NTASKS] and --nodes=[NNODES]        #
#-----------------------------------------------#
# Number of threads and nodes needed per job.   #
# Note that there are only 2 GPUs available per #
# node. Multiple programs and users may use each#
# card at one time, but you may run into        #
# performance issues. To mitigate this, use more#
# --ntasks to reduce overlap.                   #
#################################################

# Go to submission directory
cd $SLURM_SUBMIT_DIR
 
#################################################
# modules                                       #
#-----------------------------------------------#
# Any modules you need can be found with        #
# 'module avail'. If you compile something with #
# a particular compiler using a module, you     #
# probably want to call that module here.       #
#################################################
module load cuda/12.3
 
#################################################
# Run your executable here                      #
#################################################
#[EXECUTABLE] [OPTIONS]
