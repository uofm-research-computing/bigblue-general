#!/bin/bash
#SBATCH --ntasks-per-node=[NTASKS]
#SBATCH --nodes=[NNODES]
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
# Number of threads your job will need per node.#
# For normal multithreaded jobs, 'ulimit -T'    #
# will limit the number of threads you can run  #
# at once. For openMP jobs, OMP_NUM_THREADS will#
# limit the number of threads your openMP job   #
# will need.                                    #
#################################################
#ulimit -T $SLURM_NTASKS
#export OMP_NUM_THREADS=$SLURM_NTASKS

#################################################
# --nodes=[NNODES]                              #
#-----------------------------------------------#
# Number of nodes your MPI job will use. You can#
# use up to 40, but it will remain in queue for #
# a longer time if there are many jobs running. #
#################################################

#################################################
# --partition=[PARTITION/QUEUE]                 #
#-----------------------------------------------#
# computeq: 40 cores, 192 GB mem                #
# bigmemq: 40 cores, 768-1536 GB mem            #
# gpuq: 40 cores, 192 GB mem, 2 v100 GPUs       #
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
# You probably want to load the openmpi module. #
#################################################
module load openmpi/4.1.5rc2/hpcx

# What is my job ID? 
echo "$SLURM_JOB_ID"

#################################################
# Run your executable here                      #
#-----------------------------------------------#
# Note that in some documentation of mpirun, it #
# may tell you to use '-n' for number of        #
# processors. Default is [NTASKS]*[NNODES].     #
# Furthermore, some documentation might tell you#
# to use mpiexec. In most cases, this isn't     #
# needed, but if you need to manually set up the#
# mpi launcher, you might try that before       #
# execution.                                    #
# You might be interested in these environment  #
# variables:                                    #
#  SLURM_JOB_NODELIST                           #
#   The list of nodes used for an MPI job. This #
#   is a file name.                             #
#  SLURM_NNODES                                 #
#   Number of nodes used in an MPI job.         #
#  SLURM_NTASKS_PER_NODE                        #
#   Number of threads per node.                 #
#  SLURM_NTASKS                                 #
#   Number of tasks on all nodes in job.        #
#################################################
#mpirun [EXECUTABLE] [OPTIONS]
