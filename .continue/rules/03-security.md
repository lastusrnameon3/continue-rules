---
name: Security — Credentials and PKI
globs: "**/*.{ps1,py,sh,yaml,yml}"
regex: ["(?i)(venafi|cyberark|tpp|certificate|credential|creds|securestring|apikey|api_key|token|secret|password|thumbprint|privatekey|private_key)"]
alwaysApply: false
---

- Skip generic advice — flag subtle exposures and audit gaps
- Rank findings by exploitability — do not suggest fixes unless asked

## Credentials
- Never in: parameters as plaintext, logs, error messages, CI echoes, verbose/debug output
- PowerShell: SecureString for in-memory handling
- CyberArk: retrieve at runtime — never cache to disk or hold beyond immediate use
- API tokens scoped per-script — shared tokens are an audit finding
- Flag any Write-Verbose or Write-Debug inside a credential scope

## Certificates
- Every cert operation validates: chain, expiry, SANs, key usage — not just issuance
- Never assume validity — validate at runtime
- TPP 200 response does not confirm correct issuance — check response body
- Renewals need a buffer threshold — flag anything renewing within 24hrs of expiry
- Exportable private keys require documented justification
- Never write a private key to disk unencrypted

## Inputs and Validation
- Validate all inputs at entry point
- AD query results must handle empty explicitly — silent skips are failures
- Venafi responses: check for null fields, unexpected status, pagination limits, partial failures
- Never pass output from one system into another without validation

## Privilege
- Service accounts: documented scope, minimum required, approved
- Flag any script running broader than the task requires
- CyberArk safes scoped to specific account — no shared automation safes
- GitLab CI secrets: protected variables, protected branches only

## Audit
- Every privileged operation logged: what, when, under what identity, result
- Failed operations log the reason — "operation failed" is not an audit trail
- Never log at a level that captures credential values

## Pipeline
- CI variables: masked, protected, not echoed
- Never use Set-PSDebug -Trace or set -x in jobs handling credentials
- Artifacts must not contain credential data
- Flag any job passing credentials as plaintext arguments

## Dependencies
- External modules pinned to specific version
- PSGallery modules in production need documented approval
- Python packages pinned in requirements.txt
