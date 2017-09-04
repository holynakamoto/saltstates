filebeat_repo:
  pkgrepo.managed:
    - humanname: Elastic repository for 5.x packages
    - baseurl: https://artifacts.elastic.co/packages/5.x/yum
    - comments:
        - 'https://artifacts.elastic.co/packages/5.x/yum  filebeat 5.x'
    - gpgcheck: 1
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - enabled: True
    - require_in:
      - pkg: install_filebeat

install_filebeat:
  pkg.installed:
    - pkgs:
      - filebeat

enable_filebeat:
  service.enabled:
    - name: filebeat
    - require:
      - pkg: install_filebeat

start_filebeat:
  service.running:
    - name: filebeat
    - require:
      - pkg: install_filebeat