{% from "oracle-java/map.jinja" import java with context %}


webupd8team-java:
  pkgrepo.managed:
    - ppa: webupd8team/java
    - require_in:
      - pkg: oracle-java{{ java.version }}-installer
      - pkg: oracle-java{{ java.version }}-set-default


oracle-java{{ java.version }}-installer:
  pkg.installed


oracle-java{{ java.version }}-set-default:
  pkg.installed:
  - require:
    - pkg: oracle-java{{ java.version }}-installer

accept_licence:
  cmd.run:
    - name: echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
    - require_in:
      - pkg: oracle-java{{ java.version }}-installer

