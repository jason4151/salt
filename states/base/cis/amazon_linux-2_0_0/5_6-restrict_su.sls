# 5.6 Ensure access to the su command is restricted (Scored)

cis-restrict_su_access:
  file.replace:
    - name: /etc/pam.d/su
    - pattern: '^#auth\s+required\s+pam_wheel.so\s+use_uid'
    - repl: 'auth\t\trequired\tpam_wheel.so use_uid'
    - count: 1
