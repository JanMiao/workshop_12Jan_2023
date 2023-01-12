#! /bin/bash
echo -e "starting Jupyter Lab... please wait!"
jupyter-lab --no-browser --ip "*" --notebook-dir ~/workshop_12Jan_2023/SV_calling_LR/ >& jupyter-session.out &
sleep 10


node_id=$(hostname)
port=$(sed -n 's/.*localhost:\([0-9]*\)\/lab.*/\1/p' jupyter-session.out)

echo "command to use on your local machine:"
echo -e "ssh -L ${port}:${node_id}:${port} $USER@farm.cse.ucdavis.edu"

echo -e "and then use your web browser to open http://localhost:${port}"
