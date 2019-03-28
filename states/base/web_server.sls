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
    - reload: False
    - require:
      - pkg: httpd
    - watch:
      - file: /etc/httpd/conf/httpd.conf
