# 2.1.8 Ensure DNS Server is not enabled (Scored)

cis-bind:
  service.disabled:
    - name: named
    - enable: False
