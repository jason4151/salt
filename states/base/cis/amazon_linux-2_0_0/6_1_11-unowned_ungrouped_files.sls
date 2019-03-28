# 6.1.11 Ensure no unowned files or directories exist (Scored)
# 6.1.12 Ensure no ungrouped files or directories exist (Scored)

cis-unowned_files:
  cmd.run:
    - name: 'find / -xdev -nouser -print -exec chown root {} \;'

cis-ungrouped_files:
  cmd.run:
    - name: 'find / -xdev -nogroup -print -exec chgrp root {} \;'
