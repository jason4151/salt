# 1.5.1 Ensure core dumps are restricted (Scored)

cis-core_dumps-limits:
  file.managed:
    - name: /etc/security/limits.d/99-core_dumps.conf
    - mode: 644
    - user: root
    - group: root
    - contents: |
        *                hard    core            0

cis-core_dumps-sysctl:
  sysctl.present:
    - name: 'fs.suid_dumpable'
    - value: 0
