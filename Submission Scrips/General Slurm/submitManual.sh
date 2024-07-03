#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --partition=[PARTITION/QUEUE]
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
# #SBATCH --partition=acomputeq                 #
#################################################

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

#################################################
# --time=[DAYS]-[HOURS]:[MINUTES]:[SECONDS]     #
#-----------------------------------------------#
# Total time you allocate for your job. It will #
# be killed after this time. If you need an     #
# extension contact hpcadmins@memphis.edu       #
#################################################

#################################################
# --account=[DEPTCODE]                          #
#-----------------------------------------------#
# Your department code. i.e. chemistry=CHEM     #
#################################################

#################################################
# --job-name=[JOBNAME]                          #
#-----------------------------------------------#
# Your jobname when you run 'squeue'.           #
#################################################

#################################################
# --mail-user=[USERNAME]@memphis.edu            #
#-----------------------------------------------#
# It will mail you with certain statuses.       #
#################################################

#################################################
# --mail-type=[MAIL_OPTIONS]                    #
#-----------------------------------------------#
# Run 'man sbatch' to see options.              #
#################################################

#################################################
# --output=[STDOUT].out                         #
# --error=[STDERR].err                          #
#-----------------------------------------------#
# SLURM_JOB_ID with %j can be used to make      #
# output and error files unique.                #
#  e.g. --output=test-%j.out will produce       #
#  test-968.out for job 968.                    #
#################################################

#################################################
# --mem=[MEMORY_NEEDED_FOR_JOB]                 #
#-----------------------------------------------#
# Default is 4096. It is in megabytes (MB). If  #
# you need more, put it here. If you job fails  #
# check [STDERR].err to confirm that it was out #
# of memory.                                    #
#################################################

#################################################
# SLURM_SUBMIT_DIR                              #
#-----------------------------------------------#
# Usually you want to go to the directory       #
# that 'sbatch slurmSubmitSerial.sh' was called.#
# SLURM_SUBMIT_DIR is an environment variable   #
# that defines that directory. Otherwise, HOME  #
# is default (/home/[USERNAME]/).               #
#################################################
cd $SLURM_SUBMIT_DIR
 
#################################################
# modules                                       #
#-----------------------------------------------#
# Any modules you need can be found with        #
# 'module avail'. If you compile something with #
# a particular compiler using a module, you     #
# probably want to call that module here.       #
#################################################
#module load [MODULE]
 
#################################################
# SLURM_JOB_ID                                  #
#-----------------------------------------------#
# You can use SLURM_JOB_ID environment variable #
# to get the current jobId.                     #
#'squeue -u [USERNAME]' lists user jobs with    #
# jobId in the left column.                     #
#################################################
echo "$SLURM_JOB_ID"

#################################################
# Run your executable here                      #
#################################################
#[EXECUTABLE] [OPTIONS]
