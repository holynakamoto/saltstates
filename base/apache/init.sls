install_apache:
  pkg.installed:
    - pkgs:
      - httpd

index_html:
  file.managed:
    - name: /var/www/html/index.html
    - user: apache
    - group: apache
    - mode: 644
    - source: salt://apache/templates/index.html
    - template: jinja
    - defaults:
        web01_ip: '2.2.2.2'
{% if 'development' not in grains['role'] %}
    - context:
        web01_ip: {{ salt['mine.get']('web01', 'network.ip_addrs')['web01'][0] }}
{% endif %}

apache_service:
  service.running:
    - name: httpd
    - enable: True