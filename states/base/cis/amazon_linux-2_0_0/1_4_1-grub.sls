# 1.4.1 Ensure permissions on bootloader config are configured (Scored)

/boot/grub2/grub.cfg:
  file:
    - managed
    - mode: 600
    - user: root
    - group: root
