# 2.1.2 Ensure X Window System is not installed (Scored)

cis_remove_x_window_system:
  pkg.purged:
    - name: xorg-x11-server-common

cis_x_window_inittab:
  file.replace:
    - name: /etc/inittab
    - pattern: '^id:[0-9]:initdefault:'
    - repl: 'id:3:initdefault:'

cis_x_window_reload:
  cmd.wait:
    - name: telinit q
    - watch:
      - file: cis_x_window_inittab
