# Nextcloud in Docker via Ansible

Inspired by https://linuxiac.com/how-to-install-nextcloud-with-docker-compose/

## Credentials

- Credentials are handled using Ansible Vault. 
- The vault password is stored in a file called `vault_pass` in the root of this repository. 
- It is not checked into git.

## Ansible j2 templates

- All files with extensions `.j2` are Ansible j2 templates.
- Within these files, variables enclosed in double curly braces (e.g. `{{ variable_name }}`) are replaced.

## Environment variables (`.env`)

- The `resources/.env.j2` file is used by docker-compose to set environment variables.
