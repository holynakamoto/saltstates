{% if not salt.cmd.has_exec('supervisord') %}

{% set current_path = salt['environ.get']('PATH', '/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin') %}

conda-path:
   environ.setenv:
     - name: PATH
     - value: "/usr/local/bin:{{ current_path }}"
     - update_minion: True

upgrade_pip_setuptools:
  pip.installed:
    - pkgs:
      - pip
      - setuptools
    - upgrade: True
    - force_reinstall: True
    - require:
      - pkg:

supervisor_packages:
  pip.installed:
    - pkgs:
      - supervisor
      - pip
      - Distribute
    - force_reinstall: True
    - upgrade: True
    - require:
      - pip: upgrade_pip_setuptools

upgrade_setuptools:
  pip.installed:
    - pkgs:
      - setuptools
    - upgrade: True
    - force_reinstall: True

{% endif %}