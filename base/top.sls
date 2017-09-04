base:
  '*':
    - users

  'role:logger':
    - match: grain
    - elkstack

  'web*':
    - apache
    - flask_app