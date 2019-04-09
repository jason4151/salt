# This state installs the Apache web server (httpd) and required mod_php modules.

httpd_install:
  pkg.latest:
    - pkgs:
      - httpd
      - php
      - php-mysqlnd

httpd_service:
  service.running:
    - name: httpd
    - enable: True
    - reload: True
    - require:
      - pkg: httpd_install
