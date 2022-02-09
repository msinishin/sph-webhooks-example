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
  - And save the Webhook. See the screenshot below:

<img width="1140" alt="shot-1" src="https://user-images.githubusercontent.com/7306310/153091851-b3269794-1464-4a77-8bc7-a4d37ec2b46f.png">

- Create a new customer at your Spheremail app
- Open your browser at `http://your.host.domain`
- You should see the list of received events that looks like:

<img width="1309" alt="shot-1" src="https://user-images.githubusercontent.com/7306310/153089685-58bb8c7c-a81d-4f1c-adc4-8047e92b57e9.png">

- Also, you can see details of POST request coming from the Spheremail app in the console of Docker. It should look like:

<img width="1296" alt="shot-2" src="https://user-images.githubusercontent.com/7306310/153090610-6cc4c573-2eed-4705-9b66-c0c11ab7922c.png">


### Run webhooks server standalone
- Make sure that the port number 3000 is available on your host for outside connections
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

## Events Specification

### Account Created Event
The `account.create` event is sent to a Webhook endpoint when a new account is registered at the Spheremail app. The event has the following attributes:

- "id"=>26975,  // Account ID
- "event_type"=>"account.create",
- "created_at"=>"2022-02-08T14:04:28-08:00",
- "full_name"=>"Emma Student",
- "email"=>"alex+emma@spheremail.co",
- "company_name"=>"ABCD company",
- "user_name"=>"emmastudent",
- "pmb"=>nil,
- "city"=>"Belmont",
- "state"=>"CA",
- "country"=>"US",
- "street"=>"12 St. Lane",
- "phone"=>"+12222222222",
- "zip_code"=>"95001",
- "plan"=>nil,
- "created_on"=>"2022-02-08",
- "registered_on"=>"2022-02-08",
- "is_active"=>false,
- "is_admin"=>false,
- "is_mail_admin"=>false,
- "is_manager"=>false,
- "is_super_admin"=>false,
- "secret"=>"[FILTERED]"

### Mail Received Event

TO DO...

