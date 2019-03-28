# 6.1.2 Ensure permissions on /etc/passwd are configured (Scored)
# 6.1.3 Ensure permissions on /etc/shadow are configured (Scored)
# 6.1.4 Ensure permissions on /etc/group are configured (Scored)
# 6.1.5 Ensure permissions on /etc/gshadow are configured (Scored)
# 6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)
# 6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)
# 6.1.8 Ensure permissions on /etc/group- are configured (Scored)
# 6.1.9 Ensure permissions on /etc/gshadow- are configured (Scored)

{% for file, filemode in  [ ('passwd', 644 ), ('shadow', 000), ('gshadow', 000), ('group', 644) ] %}
/etc/{{file}}:
  file:
    - managed
    - mode: {{filemode}}
    - user: root
    - group: root
{% endfor %}

{% for file, filemode in  [ ('passwd-', 600 ), ('shadow-', 600), ('gshadow-', 600), ('group-', 600) ] %}
/etc/{{file}}:
  file:
    - managed
    - mode: {{filemode}}
    - user: root
    - group: root
{% endfor %}
