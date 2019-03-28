# 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
# 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
# 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)

cis-filesystem_shm:
  mount.mounted:
    - name: /dev/shm
    - device: tmpfs
    - opts: defaults,nodev,nosuid,noexec
    - fstype: tmpfs
    - mount: False
