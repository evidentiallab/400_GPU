## README:

https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

https://www.geeksforgeeks.org/remove-all-containers-and-images-in-docker/


https://code.visualstudio.com/remote/advancedcontainers/develop-remote-host


ADMIN:
```bash
sudo docker run --name <STUDENT-NAME> -p <PORT>:22 --gpus all --security-opt=seccomp:unconfined -d utseusgpu
```

https://stackoverflow.com/questions/25185405/using-gpu-from-a-docker-container


USER:
```
ssh -i private_key -p <PORT> utseus@<IP-OF-GPU-SERVER>
```

## port foward

https://askubuntu.com/questions/420766/forward-private-ip-to-public-ip

https://www.digitalocean.com/community/tutorials/how-to-forward-ports-through-a-linux-gateway-with-iptables

https://www.cloudsigma.com/forwarding-ports-with-iptables-in-linux-a-how-to-guide/

https://serverfault.com/questions/564445/how-can-i-forward-the-http-and-ssh-port-to-my-internal-server-using-iptables

https://serverfault.com/questions/564445/how-can-i-forward-the-http-and-ssh-port-to-my-internal-server-using-iptables

https://phoenixnap.com/kb/iptables-port-forwarding

https://serverfault.com/questions/234370/forward-all-ports-incoming-to-a-specific-ip-to-internal-ip-address

