base:
  '*':
    - users

  'web*':
    - apache
    - flask_app