# SonarCube Dart

This repository contains a custom SonarCube Docker image which contains a Dart plugin.

## Usage

### Start SonarCube

```
docker run --env ES_JAVA_OPTS="-Xms1024m -Xmx1024m" -d -p 9000:9000 -p 9092:9092 \
  experimentalsoftware/sonarqube-dart:0.1
```

### Sonar Scanner

In order to import the Dart project to SonarCube, the Sonar Scanner command-line tool can be used.

#### MacOS

On MacOS, `sonar-scanner` can be installed via [Homebrew](https://brew.sh/).

```
brew install sonar-scanner
```

See https://formulae.brew.sh/formula/sonar-scanner

#### Linux

On Linux, the `sonar-scanner` needs to be downloaded as ZIP file.
The unpacked binary file then needs to be added to the path so that it can be called from anywhere.

```
cd ~/bin
curl https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip \
    > sonar-scanner-cli-3.3.0.1492-linux.zip
unzip sonar-scanner-cli-3.3.0.1492-linux.zip 

PATH="$PATH:~/bin/sonar-scanner-3.3.0.1492-linux/bin"
```

See https://binaries.sonarsource.com/Distribution/sonar-scanner-cli for the latest version.

### Config

Now, create a file named `sonar-project.properties` at the root of your Dart project.
It should have the following contents:

```
sonar.projectKey=your_project
sonar.projectName=your_project
sonar.projectVersion=1.0
sonar.sources=lib
sonar.tests=test
sonar.sourceEncoding=UTF-8
sonar.exclusions='**/*.js,**/*.html,**/*.yaml'
```

### Start import

Now import of the project can be started like this:

```
cd $YOUR_DART_PROJECT
sonar-scanner -Dsonar.login=$SONAR_LOGIN -Dsonar.password=$SONAR_PASSWORD
```

The default login is "admin" and the default password is also "admin".
They have to be changed for publicly accessible SonarCube instances.

## Maintenance

Here are some internal notes for how to update this image:

```
echo "VERSION=0.1" > version
./docker-build.sh
./docker-publish.sh
```

Then update the run command in the README file and commit the new version to Git.

## References

- https://github.com/insideapp-oss/sonar-flutter
- https://hub.docker.com/_/sonarqube
- https://community.sonarsource.com/t/support-for-dart/13555
- https://levelup.gitconnected.com/integrating-sonarqube-to-your-flutter-app-using-docker-c7b2a8d94e49
- https://dev.to/janux_de/hotspot-analysis-for-a-java-project-4ej6
