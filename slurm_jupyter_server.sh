#!/bin/bash
#SBATCH --partition=compute
#SBATCH --job-name=jupyter
#SBATCH -c 8
#SBATCH --output /users/%u/jupyter-logs/jupyter_%j.log

PYTHON_ENV_NAME=${1:-default}
PORT=${2:-25565}

echo Runing on: $HOSTNAME

module purge
source ~/.bashrc
activate-python-environment $PYTHON_ENV_NAME

echo Using Python environment at: $(which python3)

jupyter-notebook --no-browser --ip=0.0.0.0 --port $PORT

echo DONE
