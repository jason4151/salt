# 2.1.13 Ensure HTTP Proxy Server is not enabled (Scored)

cis-squid:
  service.disabled:
    - name: squid
    - enable: False
