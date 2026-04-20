# CYBERARK SSH

## SSH Config (required)

```shell
Host *.example.com
  # Your user ID  
  User my-user-id-123
  # Your Cyber PSM for SSH MFA private key
  IdentityFile ~/.ssh/id_rsa
  IdentitiesOnly yes
```

## Usage

```shell
cyberark_ssh.sh [-a CYBERARK_ADDRESS] [-h] [-j CYBERARK_JUMP_HOST] [-n CYBERARK_USERNAME] [-u CYBERARK_SSH_USER] DST_SERVER
```

## Examples

```shell
# General server
cyberark_ssh.sh server123.example.com

# Specify another AC user ID
cyberark_ssh.sh -u a12345 server123.example.com

# Edge server
cyberark_ssh.sh -n LINUX_SRV_ADM_1 -a '' edge-server-123.example.com
```
