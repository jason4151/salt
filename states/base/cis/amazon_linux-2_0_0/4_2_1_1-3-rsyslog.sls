# 4.2.1.1 Ensure rsyslog Service is enabled (Scored)
# 4.2.1.2 Ensure logging is configured (Not Scored)
# 4.2.1.3 Ensure rsyslog default file permissions configured (Scored)

cis-rsyslog_pkg:
  pkg.installed:
    - name: rsyslog

cis-rsyslog_conf:
  file:
    - managed
    - name: /etc/rsyslog.conf
    - source: salt://cis/amazon_linux-2_0_0/files/rsyslog.conf
    - mode: 644
    - required:
      - pkg: rsyslog

cis-rsyslog_service:
  service.dead:
    - name: rsyslog
    - watch:
      - file: /etc/rsyslog.conf
      - pkg: rsyslog
    - enable: True
