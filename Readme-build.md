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
```

## docker gpu

https://linnote.com/tensorflow-gpu-in-docker/
