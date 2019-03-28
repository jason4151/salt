# 3.4.1 Ensure DCCP is disabled (Not Scored)
# 3.4.2 Ensure SCTP is disabled (Not Scored)
# 3.4.3 Ensure RDS is disabled (Not Scored)
# 3.4.4 Ensure TIPC is disabled (Not Scored)

cis_net_proto_modules:
  file.managed:
    - name: /etc/modprobe.d/cis-net_proto.conf
    - mode: 644
    - user: root
    - group: root
    - contents: |
        install dccp /bin/true
        install sctp /bin/true
        install rds /bin/true
        install tipc /bin/true

{% set modules = ['dccp', 'sctp', 'rds', 'tipc'] %}
cis-net_proto_modules_remove:
  kmod.absent:
    - names: {{ modules }}
