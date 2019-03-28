# 3.2.6 Ensure bogus ICMP responses are ignored (Scored)

net.ipv4.icmp_ignore_bogus_error_responses:
  sysctl:
    - present
    - value: 1
