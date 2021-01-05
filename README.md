# Home Deploy

`ssh-keygen -t ed25519 -C "Main User"`

`ssh-copy-id -i ~/.ssh/id_ed25519.pub <ip-add>`

# Ansible Deployment

## Server Setup
I recommend using Ubuntu for the Ansible server

### Ansible Install

```shell
sudo apt update
sudo apt install ansible
```

### Setup Ansible User & Create SSH Key

```shell
sudo adduser <ansible-user>
sudo usermod -aG sudo <ansible-user>
```

Login as the ansible user and create SSH Key.

```shell
ssh-keygen -t ed25519 -C "Ansible User"
```

### Download Deploy Repo

```shell
 sudo apt install -y git
 git clone https://github.com/marksie1988/home-deploy.git --recursive
 cd ~/home-deploy
```

copy the `id_ed25519.pub` file to the templates folder and rename it `ansible_user.pub`

### Install WebHook

```shell
 sudo apt install webhook
```

Configure Webhook:

```shell
 cp .stubs/webhook/webhook.json /etc/webhook.json
 chmod +x deploy-hook.sh
```

Update webhook.json with secret from Github

Enable & Start Services:

```shell
 systemctl enable webhook
 systemctl start webhook
```

Open Firewall Port:

```shell
 sudo ufw allow 9000/tcp
 sudo ufw reload
```

## Client Deployment

### Client Setup

On the Ansible server from the repo directory run the below command:

```shell
ansible-playbook authorized_keys.yml --ask-pass --ask-become-pass
```

To limit to a specific group of hosts:

```shell
ansible-playbook authorized_keys.yml --ask-pass --ask-become-pass --limit <host-group>
```
