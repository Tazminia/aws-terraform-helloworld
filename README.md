# aws-terraform-helloworld

This is a small terraform project to create simple resources on aws

## Local development

### Requirements

This repository uses terraform and tfenv.

For MacOs users, run `make setup-terraform`.

### Authentication

⚠️ Please note that the best practice is to setup SSO login with aws CLI and authenticate a personal user to run operations with a temporary access token.

However, for the purposes of a simple non critical test such as this repository, a quick solution can be:

```console
# Create a file for credentials
$ touch $HOME/.aws/credentials
# The file contains
[aws-helloworld]
aws_access_key_id = insert-access-key-id-here
aws_secret_access_key = insert-secret-access-key-here
```

## EC2 instance configuration

Once the EC2 instance is ready ansible is used to install docker and docker compose.

One possible solution to use ansible is as a python package in a virtual environment:

```bash
$ make setup-venv
$ . .venv/bin/activate
$ pip install "ansible==8.0.0"
```

### Inventory file

Ansible requires an inventory file that can be found at `ansible/inventory.yaml`.

The command `make get-ec2-dns-name` is available to get the public dns name of the created ec2 instance.

### Run ansible

The following environment variables have to be setup:

* `$SSH_KEY_LOCATION`: full path to the private ssh key to be used to connect to ec2 (defaults to `${HOME}/.ssh/helloworld-poc.pem`).

Run ansible as follows:

```bash
$ make setup-ec2-instance
```

