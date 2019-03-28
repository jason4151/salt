# 2.1.14 Ensure SNMP Server is not enabled (Scored)

cis-net_snmp:
  service.disabled:
    - name: snmpd
    - enable: False
