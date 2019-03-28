# 1.5.3 Ensure prelink is disabled (Scored)

cis-prelink_remove:
  pkg.removed:
    - name: prelink
