# 5.4.3 Ensure default group for the root account is GID 0 (Scored)

cis-root_gid:
  user.present:
    - name: root
    - uid: 0
    - gid: 0
    - remove_groups: False
