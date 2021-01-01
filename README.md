# Home Deploy


`ssh-keygen -t ed25519 -C "Main User"`

`ssh-copy-id -i ~/.ssh/id_ed25519.pub <ip-add>`


# Ansible Deployment

## Server Setup
I recommend using Ubuntu for the Ansible server


### Ansible Install

```
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

### Setup Ansible User & Create SSH Key

```
sudo adduser <ansible-user>
sudo usermod -aG sudo <ansible-user>
```

Login as the ansible user and create SSH Key.

```
ssh-keygen -t ed25519 -C "Ansible User"
```

### Download Deploy Repo

```
 sudo apt install -y git
 git clone git@github.com:totaldebug/home-deploy.git
 cd ~/home-deploy
```

copy the `id_ed25519.pub` file to the templates folder and rename it `ansible_user.pub`

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

## Client Deployment

### Client Setup

On the Ansible server from the repo directory run the below command:
```
ansible-playbook authorized_keys.yml --ask-pass --limit <server-group>
```

To limit to a specific group of hosts:
```
ansible-playbook authorized_keys.yml --ask-pass --limit <host-group>
```
