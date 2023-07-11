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