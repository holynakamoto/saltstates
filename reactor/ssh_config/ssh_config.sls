enforce_salt_config:
  local.state.sls:
    - tgt: {{ data['id'] }}
    - args:
      - sshd