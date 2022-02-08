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
- Open your browser at `http://your.host.domain`
- You should see the list of received events that looks like:

<img width="1309" alt="shot-1" src="https://user-images.githubusercontent.com/7306310/153089685-58bb8c7c-a81d-4f1c-adc4-8047e92b57e9.png">

- Also, you can see details of POST request coming from the Spheremail app in the console of Docker. It should look like:

<img width="1296" alt="shot-2" src="https://user-images.githubusercontent.com/7306310/153090610-6cc4c573-2eed-4705-9b66-c0c11ab7922c.png">


### Run webhooks server standalone
- Make sure that the port number 3000 is available for outside connections
- Start the webhooks server by the following command:

```
sudo docker run --name webhooks --workdir /sph-webhooks-example -p 127.0.0.1:3000:3000 sph-webhooks
```

- Add the URL of webhooks example server to your Spheremail app
  - In the Spheremail app, go to Account > Business Settings > Integrations > Webhooks, `+ Add Webhook`;
  - Set `Endpoint URL` to: `http://your.host.domain/account_events:3000?secret=0948707d125096dbd3bc4264a8bbf8c1`
  - Set `Events to send` to: `account.create`

- Create a new customer at your Spheremail app
- Check the events received by webhooks server in a browser at `http://your.host.domain:3000`

