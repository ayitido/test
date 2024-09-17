#!/bin/bash
#SBATCH -J test
#SBATCH -p para
#SBATCH -N 1
#SBATCH --cpus-per-task=16
echo Time is `date`
echo Directory is $PWD
echo This job runs on the following nodes:
echo $SLURM_JOB_NODELIST


echo 任务号: $(ls slurm-*.out | awk -F"[-.]" "{print \$2}" | sort -n | tail -n 1) >> ~/log.log
echo 运行目录: $PWD  >> ~/log.log
echo 开始时间: `date` >> ~/log.log
ulimit -s unlimited
source ~/intel/oneapi/setvars.sh
mpirun -np 16 HamEPC --config EPC_input.yaml
#singularity exec -e  /opt/soft/vasp/vasp632.sif mpirun -np $SLURM_JOB_CPUS_PER_NODE vasp_std
#singularity exec -e  /opt/soft/vasp/vasp632.sif mpirun -np $SLURM_JOB_CPUS_PER_NODE wannier90.x wannier90
#singularity exec -e  /opt/soft/vasp/vasp632.sif mpirun -np $SLURM_JOB_CPUS_PER_NODE wt.x

#optcell
#mpirun -np 16 myvasp_std

# openmx
#export PATH=/home/gengbin_32346034_stl_155/softwares/openmx3.9/source:${PATH}
#mpirun -np 16 openmx graphene_1.dat -nt 16 > result.std
echo 任务号: $(ls slurm-*.out | awk -F"[-.]" "{print \$2}" | sort -n | tail -n 1) >> ~/log.log
echo 结束时间: `date` >> ~/log.log
echo -e "\n" >> ~/log.log


