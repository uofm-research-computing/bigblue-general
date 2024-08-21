#!/bin/bash
#SBATCH --ntasks=[NTASKS]
#SBATCH --partition=[PARTITION/QUEUE]
#SBATCH --time=[DAYS]-[HOURS]:[MINUTES]:[SECONDS]
#SBATCH --account=[DEPTCODE]
#SBATCH --job-name=[JOBNAME]
#SBATCH --mail-user=%{USER}@memphis.edu
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
# acomputeq: 16 nodes each with 768G mem and    #
#            192 CPU cores                      #
# awholeq: 8 nodes each with 768G mem and       #
#          192 CPU cores                        #
#          (alloc cores in units of 192)        #
# abigmemq: 4 nodes each with 1.5T mem and      #
#           192 CPU cores                       #
# agpuq: 4 nodes each with 768G mem,            #
#        2 A100 GPUs, and 192 CPU cores         #
# icomputeq: 40 nodes each with 192G mem and    #
#            40 CPU cores                       #
# iwholeq: 38 nodes each with 192G mem and      #
#          40 CPU cores                         #
#          (alloc cores in units of 40)         #
# ibigmemq: 4 nodes each with 1.5T mem and      #
#           40 CPU cores                        #
# igpuq: 6 nodes each with 192G mem,            #
#        2 V100 GPUs, and 40 CPU cores          #
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
