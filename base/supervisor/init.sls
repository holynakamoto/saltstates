{% if not salt.cmd.has_exec('supervisord') %}

{% set new_path = salt['environ.get']('PATH' '/usr/sbin/:/usr/bin:/usr/:/bin:/sbin') %}

set_path:
  environ.setenv:
    - name: PATH
    - value: "/usr/local/bin{{ new_path }}"
    - update_minion: True

install_pip:
  pkg.installed:
    - pkgs:
      - python-pip

upgrade_pip_setuptools:
  pip.installed:
    - pkgs:
      - pip
      - setuptools
    - upgrade: True
    - force_reinstall: True
    - require:
      - environ: set_path

supervisor_packages:
  pip.installed:
    - pkgs:
      - supervisor
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