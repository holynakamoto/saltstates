include:
  - flask
create_app:
  file.managed:
    - name: /opt/flask_app/app.py
    - source: salt://flask_app/templates/app.py
    - user: root
    - group: root
    - mode: 0755
    - template: jinja
    - defaults:
        web01_ip: '2.2.2.2'
{% if 'development' not in grains['role'] %}
    - context:
        web01_ip: {{ salt['mine.get']('web01', 'network.ip_addrs')['web01'][0] }}
{% endif %}

create_supervisor_config:
  file.managed:
    - name: /opt/flask_app/supervisor.conf
    - source: salt://flask_app/templates/supervisor.conf
    - user: root
    - group: root
    - mode: 0644

check_supervisord:
  cmd.run:
    - name: supervisord -c /opt/flask_app/supervisor.conf
    - user: root
    - group: root
    - unless: ps aux | grep -v grep |grep -i supervisord

run_app:
  supervisord.running:
    - name: flask_app
    - user: root
    - conf_file: /opt/flask_app/supervisor.conf
    - watch:
      - file: /opt/flask_app/supervisor.conf
      - file: /opt/flask_app/app.py