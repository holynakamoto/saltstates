beacons:
  inotify:
    /etc/ssh/sshd_config:
      mask:
        - modify
    disable_during_state_run: True
