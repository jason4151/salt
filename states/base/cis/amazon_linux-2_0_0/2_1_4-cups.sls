# 2.1.4 Ensure CUPS is not enabled (Scored)

cis-cups:
  service.disabled:
    - name: cups
    - enable: False
