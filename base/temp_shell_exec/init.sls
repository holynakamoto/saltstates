echo_name:
  cmd.run:
    - name: echo "Mo Ali"

# script_file:
#   file.managed:
#     - name: /home/mo.ali/script.sh
#     - user: mo.ali
#     - mode: 755
#     - group: mo.ali

# script_run:
#   cmd.run:
#     - name: /home/mo.ali/script.sh
#     - require:
#       - file: script_file

script_run:
  cmd.script:
    - name: salt://temp_shell_exec/templates/script.sh
