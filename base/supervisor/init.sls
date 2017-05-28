{% if not salt.cmd.has_exec('supervisord') %}

yum_deps:
  pkg.installed:
    - pkgs:
      - python-setuptools
      - python-pip

upgrade_pip_setuptools:
  pip.installed:
    - pkgs:
      - pip
      - setuptools
    - upgrade: True
    - force_reinstall: True
    - require:
      - pkg: yum_deps

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