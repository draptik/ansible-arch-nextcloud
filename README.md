# Nextcloud in Docker via Ansible

Inspired by https://linuxiac.com/how-to-install-nextcloud-with-docker-compose/

## Credentials

- Credentials are handled using Ansible Vault. 
- The vault password is stored in a file called `.vault_pass` in the root of this repository. 
- It is not checked into git.
- Add `.vault_pass` to your `.gitignore` file.
- Add the content of `.vault_pass` to your password manager.

## Ansible Jinja (j2) templates

- All files with extensions `.j2` are Ansible j2 jinja templates.
- Within these files, variables enclosed in double curly braces (e.g. `{{ variable_name }}`) are replaced with values from `group_vars/vars.yml`.
- The file `group_vars/vars.yml` uses values from the Ansible Vault file `group_vars/vault`.

## Environment variables (`.env`)

- The `resources/.env.j2` file is used by docker-compose to set environment variables.
