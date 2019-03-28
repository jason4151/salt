# 6.2.14 Ensure no users have .rhosts files (Scored)

{% for user in salt['user.list_users']() %}
{% set userinfo = salt['user.info'](user) %}
{% if userinfo['uid'] > 500 or userinfo['name'] == 'root' %}
cis-rhosts-{{user}}:
  file.absent:
    - name: {{ userinfo['home'] }}/.rhosts
{% endif %}
{% endfor %}
