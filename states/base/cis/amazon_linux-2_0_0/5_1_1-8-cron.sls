# 5.1.1 Ensure cron daemon is enabled (Scored)
# 5.1.2 Ensure permissions on /etc/crontab are configured (Scored)
# 5.1.3 Ensure permissions on /etc/cron.hourly are configured (Scored)
# 5.1.4 Ensure permissions on /etc/cron.daily are configured (Scored)
# 5.1.5 Ensure permissions on /etc/cron.weekly are configured (Scored)
# 5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)
# 5.1.7 Ensure permissions on /etc/cron.d are configured (Scored)
# 5.1.8 Ensure at/cron is restricted to authorized users (Scored)

cis-crontab:
  file.managed:
    - names:
      - '/etc/crontab'
      - '/etc/anacrontab'
    - mode: 0600
    - user: root
    - group: root

{% for crondir in [ 'hourly', 'daily', 'weekly', 'monthly', 'd' ] %}
cis-crondir_{{crondir}}:
  file.directory:
    - name: /etc/cron.{{crondir}}
    - mode: 0700
    - user: root
    - group: root
{% endfor %}

cis-cron_service:
  service.dead:
    - name: crond
    - enable: True
    - sig: crond

cis-cron_deny_file:
  file.absent:
    - names:
      - /etc/cron.deny
      - /etc/at.deny

cis-cron_allow_file:
  file.managed:
    - names:
      - /etc/cron.allow
      - /etc/at.allow
    - mode: 0700
    - user: root
    - group: root
    - contents: 'root'
