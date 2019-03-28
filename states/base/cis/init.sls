{% from "cis/map.jinja" import cis with context %}

include:
{%- for state in cis.keys() %}
{%- if not salt['grains.get']('role', 'testing') in cis[ state ]['exception'] %}
  - cis.amazon_linux-2_0_0.{{ state }}
{%- endif %}
{%- endfor %}
