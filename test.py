import submitit
import torch

def add(a, b):
    print("Is gpu available: ", torch.cuda.is_available())
    return a + b


# executor is the submission interface (logs are dumped in the folder)
executor = submitit.AutoExecutor(folder="log_test")

# set parameters for running the job
num_gpus_per_node = 1
nodes = 1
executor.update_parameters(
        gpus_per_node=num_gpus_per_node,
        tasks_per_node=num_gpus_per_node,  # one task per GPU
        cpus_per_task=10, # 10 cpus per gpu is generally good
        nodes=nodes,
        # Below are cluster dependent parameters
        slurm_partition="learnfair",
        slurm_signal_delay_s=120,
    )

job = executor.submit(add, 5, 7)  # will compute add(5, 7)
print(job.job_id)  # ID of your job

output = job.result()  # waits for completion and returns output
assert output == 12  # 5 + 7 = 12...  your addition was computed in the cluster