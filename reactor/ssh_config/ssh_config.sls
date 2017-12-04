enforce_salt_config:
  local.state.sls:
    - tgt: {{ data['data']['id'] }}
    - args:
      - sshd