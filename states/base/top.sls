base:
  '*':
    - amazon_time_sync
    - cis
  'role:web-server':
    - match: grain
    - web_server
