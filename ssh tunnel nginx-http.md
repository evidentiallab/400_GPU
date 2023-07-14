# LOCAL:

```shell
python3 -m http.server 8001

ssh -f -N -T -R 8009:localhost:8001 lighthouse@43.156.84.104
```

# REMOTE:

## FIRST TIME:

```shell
sudo apt-get install -y nginx
cd /etc/nginx/sites-available
sudo vi default 
```
(and change 80 to 8081)

```shell
sudo touch tunnel
sudo vi tunnel 
```

add:
```shell
server {
    listen 8010;
    location / {
         proxy_pass http://127.0.0.1:8009;
    }
}
```

```shell
sudo ln -s /etc/nginx/sites-available/tunnel /etc/nginx/sites-enabled/tunnel
sudo nginx -c /etc/nginx/nginx.conf
sudo nginx -s reload -t
sudo nginx -s reload
```

Now I can access:

http://43.156.84.104:8010/

## second time:

```shell
sudo vi tunnel 
```

add:
```shell
server {
    listen 8010;
    location / {
         proxy_pass http://127.0.0.1:8009;
    }
}

server {
    listen 9010;
    location / {
         proxy_pass http://127.0.0.1:9009;
    }
}
```

then

```shell
sudo nginx -s reload
```

## Ref

https://serverfault.com/questions/655067/is-it-possible-to-make-nginx-listen-to-different-ports

