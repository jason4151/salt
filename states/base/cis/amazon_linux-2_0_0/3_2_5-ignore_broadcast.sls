# 3.2.5 Ensure broadcast ICMP requests are ignored (Scored)

net.ipv4.icmp_echo_ignore_broadcasts:
  sysctl:
    - present
    - value: 1
