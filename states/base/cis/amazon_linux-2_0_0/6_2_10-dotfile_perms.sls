# 6.2.10 Ensure users' dot files are not group or world writable (Scored)

# Loop over users
{% for user in salt['user.list_users']() %}
# Set helper var
{% set userinfo = salt['user.info'](user) %}
# Static exceptions
{% if not (user in [ 'root', 'sync', 'halt', 'shutdown' ] or userinfo['shell'] == '/sbin/nologin' ) %}

# Find dotfiles and repair
cis-dotfile_perm_gw-{{user}}:
  cmd.run:
    - name: 'find {{userinfo['home']}} -name ".*" -user {{user}} -perm -0020 -print -exec chmod g-w {} \;'

cis-dotfile_perm_ow-{{user}}:
  cmd.run:
    - name: 'find {{userinfo['home']}} -name ".*" -user {{user}} -perm -0002 -print -exec chmod o-w {} \;'

{% endif %}
{% endfor %}
