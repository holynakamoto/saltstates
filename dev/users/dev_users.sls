user_kat_douglas:
  user.present:
    - name: kat.douglas
    - fullname: Katherine Douglas
    - shell: /bin/bash
    - home: /home/kat.douglas
    - uid: 10001
    - gid_from_name: True
    - groups:
      - wheel

kat_douglas_key:
  ssh_auth.present:
    - name: kat.douglas
    - user: kat.douglas
    - source: salt://users/keys/kat.douglas.pub
