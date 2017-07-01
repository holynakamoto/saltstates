install_apache:
  pkg.installed:
    - pkgs:
      - httpd

{% if 'development' in grains['role'] %}
index_html:
  file.managed:
    - name: /var/www/html/index.html
    - user: apache
    - group: apache
    - mode: 644
    - source: salt://apache/templates/development_index.html
    - template: jinja
{% else %}
index_html:
  file.managed:
    - name: /var/www/html/index.html
    - user: apache
    - group: apache
    - mode: 644
    - source: salt://apache/templates/index.html
    - template: jinja
{% endif %}

apache_service:
  service.running:
    - name: httpd
    - enable: True