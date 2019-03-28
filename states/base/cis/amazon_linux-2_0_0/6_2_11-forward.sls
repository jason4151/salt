# 6.2.11 Ensure no users have .forward files (Scored)

{% for user in salt['user.list_users']() %}
{% set userinfo = salt['user.info'](user) %}
{% if userinfo['uid'] > 500 or userinfo['name'] == 'root' %}
cis-forward-{{user}}:
  file.absent:
    - name: {{ userinfo['home'] }}/.forward
{% endif %}
{% endfor %}

