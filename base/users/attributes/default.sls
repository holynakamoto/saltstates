{% if 'vagrant' in grains['fqdn'] %}
cloud_info:
  grains.present:
    - name: cloud_info
    - value:
      - provider: Vagrant
{% endif %}