# linmon
**One stop bird's eye monitoring tool for linux desktops/servers**

![linmon_cropped](https://cloud.githubusercontent.com/assets/1522438/22509531/1c7da968-e897-11e6-930c-6fc4e4dd83c6.png)

## Gist
This script gives a high level view on network, I/O, CPU, Memory and load usages in real time
This installs necessary packages and starts the monitoring tools 
into a tmux session (linmon) on different panes.
Needs root previlleges to run especially for iftop

### Commands used (if you are not interested in running the shell script)
To start a 4 pane-d tmux session monitoring: 

`tmux new-session -s linmon -d htop \; split-window -d 'watch -n1 iostat'\; select-pane -t1 \; split-window -dh 'sudo iftop' \; split-window -d 'bash -c "echo Press enter to end monitoring; read n; tmux kill-session -t linmon"' \; select-pane -t2`

