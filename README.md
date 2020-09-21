# Home Deploy


`ssh-keygen -t ed25519 -C "Main User"`

`ssh-copy-id -i ~/.ssh/id_ed25519.pub <ip-add>`


# Ansible Deployment

## Server Setup

### Download Deploy Repo

```
 yum install -y git
 git clone git@github.com:totaldebug/home-deploy.git
 cd ~/home-deploy
```

### Install WebHook

```
 sudo apt install webhook
```

Configure Webhook: 

```
 cp .stubs/webhook/webhook.json /etc/webhook.json
 chmod +x deploy-hook.sh
```

Update webhook.json with secret from Github

Enable & Start Services:

```
 systemctl enable webhook
 systemctl start webhook
```

Open Firewall Port: 

``` 
 sudo ufw allow 9000/tcp
 sudo ufw reload
```

### Ansible Install

Add the following to `/etc/apt/sources.list`

`deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main`

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt update
sudo apt install ansible
```

### Setup Ansible User
