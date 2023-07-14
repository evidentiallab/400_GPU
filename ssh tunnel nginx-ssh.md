# LOCAL:

```shell
sudo docker run --name lunde2 -p 20002:22 --security-opt=seccomp:unconfined -d utseusgpu

ssh -f -N -T -R 10002:localhost:20002 lighthouse@43.156.84.104
```

# REMOTE:

## FIRST TIME:

```shell
cd /etc/nginx/sites-available
sudo vi default (and change 80 to 8081)
sudo touch tunnel
sudo vi tunnel 
```

add:
```shell
server {
    listen 30002;
    location / {
         proxy_pass http://127.0.0.1:10002;
    }
}
```

```shell
sudo ln -s /etc/nginx/sites-available/tunnel /etc/nginx/sites-enabled/tunnel
sudo nginx -c /etc/nginx/nginx.conf
sudo nginx -s reload -t
sudo nginx -s reload
```

## second time:

```shell
sudo vi tunnel 
sudo nginx -s reload
```



## Ref

https://medium.com/the-software-reliever/expose-localhost-to-the-public-www-with-a-vps-nginx-and-ssh-tunneling-daefc0275757

https://serverfault.com/questions/655067/is-it-possible-to-make-nginx-listen-to-different-ports



## TODO:

add `-g`?

https://unix.stackexchange.com/questions/10428/simple-way-to-create-a-tunnel-from-one-local-port-to-another



Maybe:
```shell
$ sudo vi /etc/ssh/sshd_config
   Port 22
   Port 8888
```