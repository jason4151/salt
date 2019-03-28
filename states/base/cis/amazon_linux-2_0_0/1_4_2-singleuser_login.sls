# 1.4.2 Ensure authentication required for single user mode (Scored)

cis-singleuser_login:
  file.replace:
    - name: /etc/sysconfig/init
    - pattern: '^SINGLE=/sbin/sushell'
    - repl: 'SINGLE=/sbin/sulogin'
