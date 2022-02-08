# README

### Requirements
- Docker installed on your host

### Build webhooks server
- Clone this repository to your host;
- Change the current directory to the cloned `sph-webhooks-example` folder;
- Build the docker image by the following command:

```
sudo docker build -t sph-webhooks .
```

### Run webhooks server with NGINX
- Start the webhooks server by the following command:

```
sudo docker run --name webhooks --workdir /sph-webhooks-example -p 127.0.0.1:3000:3000 sph-webhooks
```
- Add the following virtual server configuration to the NGINX sites enabled:

```
# Spheremail webhooks example server
server {
  listen 80;
  server_name your.host.domain;

  location / {
    proxy_pass http://127.0.0.1:3000;
  }
}
```
- Add the URL of webhooks example server to your Spheremail app
  - In the Spheremail app, go to Account > Business Settings > Integrations > Webhooks, `+ Add Webhook`;
  - Set `Endpoint URL` to: `http://your.host.domain/account_events?secret=0948707d125096dbd3bc4264a8bbf8c1`
  - Set `Events to send` to: `account.create`

- Create a new customer at your Spheremail app
- Check the events received by webhooks server in a browser at `http://your.host.domain`
