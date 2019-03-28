# 1.1.18 Ensure sticky bit is set on all world-writable directories (Scored)

cis-set-writable-sticky-bits:
  cmd.run:
    - name: 'find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \) -print 2> /dev/null -exec chmod a+t {} \;'
    - cwd: /
    - stateful: True
