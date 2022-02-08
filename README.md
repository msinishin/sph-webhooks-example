# README

### Requirements
- Docker installed on your host

### Build server
- Clone this repository to your host;
- Change the current directory to the `sph-webhooks-example`;
- Build the docker image by the following command:

```
sudo docker build -t sph-webhooks .
```

### Start server
- Start the server by the following command:

```
sudo docker run --name webhooks --workdir /sph-webhooks-example -p 127.0.0.1:3000:3000 sph-webhooks
```
