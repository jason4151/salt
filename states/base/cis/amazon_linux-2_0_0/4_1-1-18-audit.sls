# 4.1 Configure System Accounting (auditd)
# 4.1.1 Configure Data Retention 
# 4.1.2 Enable auditd servide is enabled (Scored)
# 4.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
# 4.1.4 - 4.1.18 Audit rules (Scored)

cis-audit_pkg:
  pkg.installed:
    - name: audit

cis-audit_conf:
  file.managed:
    - name: /etc/audit/auditd.conf
    - source: salt://cis/amazon_linux-2_0_0/files/auditd.conf
    - require:
      - pkg: audit

cis-audit_rules:
  file.managed:
    - name: /etc/audit/rules.d/cis-audit.rules
    - source: salt://cis/amazon_linux-2_0_0/files/cis-audit.rules
    - mode: 0640
    - require:
      - pkg: audit

{%- if salt['grains.get']('dockerhost', False) == True %}
# CIS Docker 1.13.0 benchmark audit rules 1.5, 1.6, 1.7
docker_audit_rules:
  file.append:
    - name: /etc/audit/audit.rules
    - text:
      - "\n# CIS Docker 1.13.0 benchmark audit rules 1.5, 1.6, 1.7"
      - "-w /usr/bin/docker -k docker"
      - "-w /var/lib/docker -k docker"
      - "-w /etc/docker -k docker"
    - require:
      - file: audit_rules
{%- endif %}

cis-audit_service:
  service.running:
    - watch:
      - file: cis-audit_conf
      - file: cis-audit_rules
      - pkg: audit
    - name: auditd
    - enable: True
