# 3.2.8 Ensure TCP SYN Cookies is enabled (Scored)

net.ipv4.tcp_syncookies:
  sysctl:
    - present
    - value: 1
