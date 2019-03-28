# 5.4.2 Ensure system accounts are non-login (Scored)

{% for user in salt['user.list_users']() %}
{% set userinfo = salt['user.info'](user) %}
{% if userinfo['uid'] < 500 and not ( user in [ 'root', 'sync', 'shutdown', 'halt' ] )  %}
cis-sysacc_shell-{{user}}-{{ range(1024)|random }}:
  user.present:
    - name: {{user}}
    - shell: '/sbin/nologin'
    - remove_groups: False
{% endif %}
{% endfor %}
