# 4.2.4 Ensure permissions on all log files are configured (Scored)

cis-all_logs_permissions:
  cmd.run:
    - name: find /var/log -type f -exec chmod g-wx,o-rwx {} \;
