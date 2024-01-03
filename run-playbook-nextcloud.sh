#!/bin/sh

set -o nounset
set -o errexit

## Note: append `-vvv` to the end of the command for verbose output
ansible-playbook \
    --vault-password-file=.vault_pass \
    --inventory ansible-inventory.cfg \
    playbook-arch-nextcloud.yml