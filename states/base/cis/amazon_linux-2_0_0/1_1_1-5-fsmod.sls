# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
# 1.1.1.2 Ensure mounting of hfs filesystems is disabled (Scored)
# 1.1.1.3 Ensure mounting of hfsplus filesystems is disabled (Scored)
# 1.1.1.4 Ensure mounting of squashfs filesystems is disabled (Scored)
# 1.1.1.5 Ensure mounting of udf filesystems is disabled (Scored)

filesystem_modules:
  file.managed:
    - name: /etc/modprobe.d/cis-fsmod.conf
    - mode: 644
    - user: root
    - group: root
    - contents: |
       install cramfs /bin/true
       install hfs /bin/true
       install hfsplus /bin/true
       install squashfs /bin/true
       install udf /bin/true

{% set modules = ['cramfs', 'hfs', 'hfsplus', 'squashfs', 'udf' ] %}
cis-filesystem_modules_remove:
  kmod.absent:
    - names: {{ modules }}
