#!/bin/bash
#SBATCH --ntasks=[NTASKS]
#SBATCH --partition=[PARTITION/QUEUE]
#SBATCH --time=[DAYS]-[HOURS]:[MINUTES]:[SECONDS]
#SBATCH --account=[DEPTCODE]
#SBATCH --job-name=[JOBNAME]
#SBATCH --mail-user=%{USER}@memphis.edu
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

cd $SLURM_SUBMIT_DIR

#################################################
# Scratch Directory                             #
#-----------------------------------------------#
# While there are not seperate drives on the    #
# nodes, there is a scratch directory that is   #
# subject to periodic cleaning. You can use     #
# the '/scratch' directory. It is seperated by  #
# user name. Try to use it if you have a lot of #
# files you don't need to be backed up. At the  #
# end is a copy-back.                           #
#################################################
# Set the temporary directory
tmpdir="/scratch/${USER}/${SLURM_JOB_ID}"

# Make the temporary directory
mkdir -p $tmpdir

# Copy job directory to temporary directory
rsync -a ./

# Change to temporary directory
cd $tmpdir

# Load some modules. 
#module load [MODULE]

#################################################
# Run your executable here                      #
#################################################
#[EXECUTABLE] [OPTIONS]

#################################################
# Copy job files back to home directory and     #
# do cleanup. It is recommended that you delete #
# any temporary files that are not needed.      #
#################################################

# You should clean up the output before copying
# back to your submission directory!
#rm temporary_files

# Go back to submission directory.
cd $SLURM_SUBMIT_DIR

# Copy everything in temporary directory to 
# submission directory.
rsync -a $tmpdir/ .

# Remove the temporary directory.
rm -fr $tmpdir