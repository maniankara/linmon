# linmon
**One stop monitoring tool for linux machines**

## Gist
This script installs necessary packages and starts the monitoring tools 
into a tmux session (linmon) on different panes.

### Commands used
To start a 4 pane-d tmux session monitoring: 

`tmux new-session -s linmon -d htop \; split-window -d 'watch -n1 iostat'\; select-pane -t1 \; split-window -dh 'sudo iftop' \; split-window -d 'bash -c "echo Press enter to end monitoring; read n; tmux kill-session -t linmon"' \; select-pane -t2`

