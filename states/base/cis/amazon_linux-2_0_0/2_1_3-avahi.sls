# 2.1.3 Ensure Avahi Server is not enabled (Scored)

cis-avahi_daemon:
  service.disabled:
    - name: avahi-daemon
    - enable: False
