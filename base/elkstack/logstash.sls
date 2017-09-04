logstash_repo:
  pkgrepo.managed:
    - humanname: Elastic repository for 5.x packages
    - baseurl: https://artifacts.elastic.co/packages/5.x/yum
    - comments:
        - 'https://artifacts.elastic.co/packages/5.x/yum  Logstash 5.x'
    - gpgcheck: 1
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - enabled: True
    - require_in:
      - pkg: install_logstash

install_logstash:
  pkg.installed:
    - pkgs:
      - logstash


enable_logstash:
  service.enabled:
    - name: logstash
    - require:
      - pkg: install_logstash

start_logstash:
  service.running:
    - name: logstash
    - require:
      - pkg: install_logstash