kibana_repo:
  pkgrepo.managed:
    - humanname: Kibana repository for 5.x packages
    - baseurl: https://artifacts.elastic.co/packages/5.x/yum
    - comments:
        - 'https://artifacts.elastic.co/packages/5.x/yum  Kibana 5.x'
    - gpgcheck: 1
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - enabled: True
    - require_in:
      - pkg: install_kibana

install_kibana:
  pkg.installed:
    - pkgs:
      - kibana

enable_kibana:
  service.enabled:
    - name: kibana
    - require:
      - pkg: install_kibana

start_kibana:
  service.running:
    - name: kibana
    - require:
      - pkg: install_kibana