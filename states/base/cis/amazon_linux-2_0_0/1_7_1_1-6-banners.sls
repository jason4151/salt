# 1.7.1.1 Ensure message of the day is configured properly (Scored)
# 1.7.1.2 Ensure local login warning banner is configured properly (Not Scored)
# 1.7.1.3 Ensure remote login warning banner is configured properly (Not Scored)
# 1.7.1.4 Ensure permissions on /etc/motd are configured (Not Scored)
# 1.7.1.5 Ensure permissions on /etc/issue are configured (Scored)
# 1.7.1.6 Ensure permissions on /etc/issue.net are configured (Not Scored)

# Disable motd from being updated
update-motd--disable:
  cmd.run:
    - name: '/usr/sbin/update-motd --disable'

# Replace motd with a warning
cis-banner_motd:
  file.managed:
    - name: /etc/motd
    - mode: 644
    - user: root
    - group: root
    - contents: Authorized uses only. All activity may be monitored and reported.

{% for file in [ 'issue', 'issue.net'] %}
cis-banner_{{ file }}:
  file.managed:
    - name: /etc/{{ file }}
    - mode: 644
    - user: root
    - group: root
    - contents: Authorized uses only. All activity may be monitored and reported.
{% endfor %}