# 6.1.10 Ensure no world writable files exist (Scored)

cis-world_writable:
  cmd.run:
    - name: 'find / -xdev -type f -perm -0002 -print -delete'
