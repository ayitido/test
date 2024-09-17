import os
num_cores = os.getenv("SLURM_JOB_CPUS_PER_NODE", 1)
ls = os.listdir()
for _ in ls:
    if ".dat" in _:
        os.makedirs(_[:-4],exist_ok=True)
        os.chdir(_[:-4])
        os.system(f"cp ../{_} openmx.dat")
        os.system(f"mpirun -np {num_cores} /home/gengbin_32346034_stl_155/softwares/MachineLearning/HamGNN/openmx_postprocess/openmx_postprocess openmx.dat")
        os.chdir("..")
