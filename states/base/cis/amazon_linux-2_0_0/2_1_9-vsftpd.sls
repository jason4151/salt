# 2.1.9 Ensure FTP Server is not enabled (Scored)

cis-vsftpd:
  service.disabled:
    - name: vsftpd
    - enable: False
