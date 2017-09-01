#!/bin/sh

# Defaults
EXEC=${EXEC:-geth}

# SSH_PORT=${SSH_PORT:-2022}
# SSH_USER=${SSH_USER:-app}
# ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
# ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa && \
# ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa && \
# ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519 && \
# /usr/sbin/sshd 

# Exec ARGS or EXEC
exec ${@:-$EXEC}
