# 4.3 Ensure logrotate is configured (Not Scored)

logrotate_syslog_conf:
  file:
    - managed
    - name: /etc/logrotate.d/syslog
    - mode: 644
    - contents: |
        /var/log/cron
        /var/log/maillog
        /var/log/messages
        /var/log/secure
        /var/log/spooler
        /var/log/boot.log
        /var/log/kern.log
        /var/log/daemon.log
        /var/log/syslog
        /var/log/unused.log
        {
            sharedscripts
            postrotate
               /bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true
            endscript
        }
