include:
  - supervisor

install_flask:
  pip.installed:
    - pkgs:
      - flask

app_dir:
  file.directory:
    - name: /opt/flask_app
    - user: root
    - group: root
    - mode: 0755
