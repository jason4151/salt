# 1.5.2 Ensure address space layout randomization (ASLR) is enabled (Scored)

cis-random_va:
  sysctl.present:
    - name: 'kernel.randomize_va_space'
    - value: 2
