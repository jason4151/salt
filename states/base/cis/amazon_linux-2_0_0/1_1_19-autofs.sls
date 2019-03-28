# 1.1.19 Disable Automounting (Scored)

cis-autofs:
  service.dead:
    - name: autofs
    - enable: False
