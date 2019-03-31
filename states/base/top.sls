base:
  '*':
    - amazon_time_sync
    - cis
  # 'role: jenkins':
  #   - match: grain
  #   - jenkins
   'role:web-server':
     - match: grain
     - web_server
