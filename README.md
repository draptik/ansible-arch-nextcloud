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

## Upgrading to v28 (2024-04-25)

### Add missing indices error

- ssh into server
- run the following command:
  ```
  docker exec --user 33 -it nextcloud-app php occ db:add-missing-indices
  ```

### Missing maintenance window error

- ssh into server
- run the following command:
  ```
  docker exec --user 33 -it nextcloud-app php occ config:system:set maintenance-window_start --type=integer --value=1
  ```

### Missing default phone region error

- ssh into server
- run the following command:
  ```
  docker exec --user 33 -it nextcloud-app php occ config:system:set default_phone_region --value="DE"
  ```

### Setting Email server

- Create app secret on gmail
  - login to gmail admin site
  - `Security` -> `2-Step Verification` -> `App passwords`
  - Create new app password for nextcloud and store password in KeepassXC
- log into admin account via web interface
- `Administration` -> `Basic settings` -> `Email server`
  - Send mode: SMTP
  - Encryption: SSL
  - From address: gmail address
  - Server address: `smtp.gmail.com` port `465`
  - Authentication required: check
  - Credentials
    - User: gmail address
    - Password: use app password from gmail

