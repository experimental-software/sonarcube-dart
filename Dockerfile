FROM sonarqube:8.2-community

COPY sonar-flutter-plugin-0.3.1.jar /opt/sonarqube/extensions/plugins
