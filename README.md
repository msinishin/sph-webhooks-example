# README

### Requirements
- Docker installed on your host

### Build server
- Clone this repository to your host;
- Change the current directory to the cloned `sph-webhooks-example` folder;
- Build the docker image by the following command:

```
sudo docker build -t sph-webhooks .
```

### Start server
- Start the webhooks server by the following command:

```
sudo docker run --name webhooks --workdir /sph-webhooks-example -p 127.0.0.1:3000:3000 sph-webhooks
```
