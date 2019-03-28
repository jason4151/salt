# 2.1.16 Ensure NIS Server is not enabled (Scored)

{% set services = ['ypserv', 'yppasswd', 'ypxfrd'] %}
cis-nis:
  service.disabled:
    - names: {{ services }}
    - enable: False
