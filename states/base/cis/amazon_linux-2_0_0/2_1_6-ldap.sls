# 2.1.6 Ensure LDAP server is not enabled (Scored)

cis-ldap:
  service.disabled:
    - name: slapd
    - enable: False
