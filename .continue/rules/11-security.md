---
name: Security — Credentials and Secrets
globs: "**/*.{ps1,py,sh,yaml,yml,json,env,cfg,conf,ini,toml}"
regex: ["(?i)(credential|apikey|api_key|token|secret|password|privatekey|private_key|certificate|thumbprint|venafi|cyberark|tpp)"]
alwaysApply: false
---

- Skip generic advice — flag subtle exposures and audit gaps
- Rank findings by exploitability — do not suggest fixes unless asked

## Credentials
- Never in: parameters as plaintext, logs, error messages, CI echoes, verbose/debug output
- Retrieve at runtime from the credential store — never cache to disk or hold beyond immediate use
- API tokens scoped per-script — shared tokens are an audit finding
- Flag any debug/verbose output inside a credential scope

## Certificates
- Every cert operation validates: chain, expiry, SANs, key usage — not just issuance
- Never assume validity — validate at runtime
- A 200 response from the CA does not confirm correct issuance — check the response body
- Renewals need a buffer threshold — flag anything renewing within 24hrs of expiry
- Exportable private keys require documented justification
- Never write a private key to disk unencrypted

## Inputs and Validation
- Validate all inputs at entry point
- Directory/API query results must handle empty explicitly — silent skips are failures
- External system responses: check for null fields, unexpected status, pagination limits, partial failures
- Never pass output from one system into another without validation

## Privilege
- Service accounts: documented scope, minimum required, approved
- Flag any script running broader than the task requires
- Credential vault safes scoped to specific accounts — no shared automation safes
- CI secrets: protected variables, protected branches only

## Audit
- Every privileged operation logged: what, when, under what identity, result
- Failed operations log the reason — "operation failed" is not an audit trail
- Never log at a level that captures credential values

## Pipeline
- CI variables: masked, protected, not echoed
- Never enable trace-level debugging in jobs handling credentials
- Artifacts must not contain credential data
- Flag any job passing credentials as plaintext arguments

## Dependencies
- External modules pinned to specific version
- Modules from public registries in production need documented approval
- Package dependencies pinned in lock files or requirements files
