# 2.1.11 Ensure IMAP and POP3 server is not enabled (Scored)

cis-dovecot:
  service.disabled:
    - name: dovecot
    - enable: False
