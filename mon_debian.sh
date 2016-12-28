#!/usr/bin/env bash
# Only for localhost purposes only i.e. the script should be in the host which needs monitoring

INSTALL_CMD='sudo apt install -y';
PKG_LIST='htop sysstat iftop tmux';

function install_packages() {
    echo "INFO: Installing packages";
    $INSTALL_CMD $PKG_LIST
}
function main {
    echo "INFO: Starting preparation";
    echo "INFO: The following packages will be installed";
    echo "INFO: htop(cpu usage), sysstat(iostat for io usage), iftop(network usage) and tmux for UI";
    echo "Please press enter to continue or Ctrl+c to abort";
    read n;
    install_packages;
    echo "INFO: Launching tumx";
    # -s <name of the session>,
    # -d <shell_command>
    # panes are numbered from 0
    tmux new-session -s linmon -d htop \; split-window -d 'watch -n1 iostat'\; select-pane -t1 \; split-window -dh 'sudo iftop' \; split-window -d 'bash -c "echo Press enter to end monitoring; read n; tmux kill-session -t linmon"' \; select-pane -t2
    echo "INFO: Press enter to attach or Ctrl+c to stay detached";
    read n;
    tmux attach -t linmon
}

main $*;