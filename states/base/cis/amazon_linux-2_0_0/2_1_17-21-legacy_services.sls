# 2.1.17 Ensure rsh server is not enabled (Scored)
# 2.1.18 Ensure telnet server is not enabled (Scored)
# 2.1.19 Ensure tftp server is not enabled (Scored)
# 2.1.20 Ensure rsync service is not enabled (Scored)
# 2.1.21 Ensure talk server is not enabled (Scored)

{% set legacy_services_remove = [ 'telnet-server', 'telnet', 'rsh-server', 'rsh', 'ypbind', 'ypserv', 'tftp', 'tftp-server', 'talk', 'talk-server' ] %}
cis_remove_legacy_services:
  pkg.purged:
    - pkgs: {{ legacy_services_remove }}
