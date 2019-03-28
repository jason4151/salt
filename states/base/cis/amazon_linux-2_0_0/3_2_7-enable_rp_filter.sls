# 3.2.7 Ensure Reverse Path Filtering is enabled (Scored)

net.ipv4.conf.all.rp_filter:
  sysctl:
    - present
    - value: 1

net.ipv4.conf.default.rp_filter:
  sysctl:
    - present
    - value: 1
