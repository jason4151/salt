# 5.3.4 Ensure password hashing algorithm is SHA-512 (Scored)

{% if salt['cmd.run']('authconfig --test | grep hash') != ' password hashing algorithm is sha512' %}
cis_pass_alg:
  cmd.run:
    - name: 'authconfig --passalgo=sha512 --update'
{% endif %}
