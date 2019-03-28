# 2.1.7 Ensure NFS and RPC are not enabled (Scored)

{% set services = ['nfslock', 'rpcgssd', 'rpcbind', 'rpcidmapd', 'rpcsvcgssd', 'nfs'] %}
cis-nfs:
  service.disabled:
    - names: {{ services }}
    - enable: False
