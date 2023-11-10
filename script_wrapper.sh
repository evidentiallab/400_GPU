#!/bin/bash

# Start the first process
./script_sshd.sh &

# Start the second process
./script_frpc.sh &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?