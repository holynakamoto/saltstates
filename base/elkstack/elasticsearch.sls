elasticsearch_repo:
  pkgrepo.managed:
    - humanname: Elasticsearch repository for 5.x packages
    - baseurl: https://artifacts.elastic.co/packages/5.x/yum
    - comments:
        - 'https://artifacts.elastic.co/packages/5.x/yum  Elasticsearch 5.x'
    - gpgcheck: 1
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - enabled: True
    - require_in:
      - pkg: install_elasticsearch

install_elasticsearch:
  pkg.installed:
    - pkgs:
      - elasticsearch

enable_elasticsearch:
  service.enabled:
    - name: elasticsearch
    - require:
      - pkg: install_elasticsearch

start_elasticsearch:
  service.running:
    - name: elasticsearch
    - require:
      - pkg: install_elasticsearch