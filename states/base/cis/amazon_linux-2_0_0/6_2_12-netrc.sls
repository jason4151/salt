# 6.2.12 Ensure no users have .netrc files (Scored)

{% for user in salt['user.list_users']() %}
{% set userinfo = salt['user.info'](user) %}
{% if userinfo['uid'] > 500 or userinfo['name'] == 'root' %}
cis-netrc-{{user}}:
  file.absent:
    - name: {{ userinfo['home'] }}/.netrc
{% endif %}
{% endfor %}
