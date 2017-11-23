#!/bin/bash
OPTS=""
echo "$HOME/notebooks/index.ipynb: " $HOME/notebooks/index.ipynb
if [ -e $HOME/notebooks/index.ipynb ]; then
  OPTS="$OPTS --NotebookApp.default_url=/tree/index.ipynb "
fi
if [ -e $HOME/.binder_start ]; then
  source $HOME/.binder_start
fi
CMD="$OPTS $@"
echo "CMD: " $CMD
ipython notebook --NotebookApp.iopub_data_rate_limit=10000000000 $CMD