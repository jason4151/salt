# Amazon provides the Amazon Time Sync Service, which can be accessed by EC2 instances.
# http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-time.html

ntp_remove:
  pkg.removed:
    - name: ntp

chrony_install:
  pkg.latest:
    - name: chrony

chrony_conf:
  file.managed:
    - name: /etc/chrony.conf
    - mode: 644
    - user: root
    - group: root
    - contents: server 169.254.169.123 prefer iburst
    - require:
      - pkg: chrony

chrony_service:
  service.running:
    - name: chronyd
    - reload: False
    - require:
      - pkg: chrony
    - watch:
      - file: /etc/chrony.conf
