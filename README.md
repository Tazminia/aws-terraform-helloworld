# aws-terraform-helloworld

This is a small terraform project to create simple resources on aws

## Local development

### Requirements

This repository uses terraform and tfenv.

For MacOs users, run `make setup-local-env`.

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
