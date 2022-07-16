# Vault CLI
Vault cli docker image authenticated by approle method.
## Usage

Required environment variables:
- `VAULT_ADDR`
- `VAULT_APPROLE`
- `VAULT_APPROLE_SECRET`

To login:
```bash
docker run --entrypoint vault-login \
-e VAULT_ADDR=<vault-address> \
-e VAULT_APPROLE=<vault-approle> \
-e VAULT_APPROLE_SECRET=<vault-approle-secret-id> \
minghsu0107/vault-cli
```