## First time configuration

Load the image and run it:
```bash
sudo docker load -i utseusgpu.tar
sudo docker images
sudo docker ps -a
```

## if you want to challenge youself

This is optional. If you want to build the image from Dockerfile:

```bash
sudo  echo '{ "features": { "buildkit": true } }' | sudo tee /etc/docker/daemon.json && sudo service docker restart
sudo docker build -t utseusgpu .
sudo docker save -o ~/utseusgpu.tar utseusgpu
sudo chmod 666 ~/utseusgpu.tar
```

## docker gpu

https://linnote.com/tensorflow-gpu-in-docker/

https://hub.docker.com/r/nvidia/cuda/tags?page=1

## portainer.io

https://docs.portainer.io/start/install-ce/server/docker/linux


## port foward

https://askubuntu.com/questions/420766/forward-private-ip-to-public-ip

https://www.digitalocean.com/community/tutorials/how-to-forward-ports-through-a-linux-gateway-with-iptables

https://www.cloudsigma.com/forwarding-ports-with-iptables-in-linux-a-how-to-guide/

https://serverfault.com/questions/564445/how-can-i-forward-the-http-and-ssh-port-to-my-internal-server-using-iptables

https://serverfault.com/questions/564445/how-can-i-forward-the-http-and-ssh-port-to-my-internal-server-using-iptables

