# docker-java-autoheap
Docker minimal jre with auto heap memory

# base image

The minial official jre java:8-jre-alpine

You can edit Dockerfile to change the basic image

# Feature

- auto heap memory size based on docker run -m options
- auto GMT+8 timezone (for China)
- auto combine JAVA_OPTS environment

# Build

```bash
/home/jamling/docker-java-autoheap # docker build -t jre8:latest .
```

Please `docker build --help` for more information

# Usage

`java2 jarfile.jar [options]`, sample : `java2 /hello.jar -e -p -q`

in [docker-maven-plugin]

```xml
				<plugin>
					<groupId>com.spotify</groupId>
					<artifactId>docker-maven-plugin</artifactId>
					<version>1.0.0</version>
					<configuration>
						<imageName>${docker.registry}/${project.artifactId}</imageName>
						<baseImage>jre8:latest</baseImage>
						<!--<entryPoint>["sh", "-c", "java $JAVA_OPTS -jar /${project.artifactId}.jar"]</entryPoint>-->
						<entryPoint>["java2", "/${project.artifactId}.jar"]</entryPoint>
						<!-- copy the service's jar file from target into the root directory of the image -->
						<imageTags>
							<!--<imageTag>${project.release.version}</imageTag>-->
							<imageTag>latest</imageTag>
						</imageTags>
						<!--<image>${project.artifactId}</image>
						<newName>${docker.registry}/${project.artifactId}:${project.release.version}</newName>-->
						<registryUrl>${docker.registry}</registryUrl>
						<resources>
							<resource>
								<targetPath>/</targetPath>
								<directory>${project.build.directory}</directory>
								<include>${project.artifactId}.jar</include>
							</resource>
						</resources>
					</configuration>
```

# hello.jar

Print Runtime total memory and free memory, and run in while block (press q to quit). 

Options

-e print the system environment
-p print the system properties
-q don't entry while block

# Refer

[docker-tomcat-autoheap]
[docker-maven-plugin]


[docker-maven-plugin]: https://github.com/spotify/docker-maven-plugin
[docker-tomcat-autoheap]: https://github.com/denverdino/docker-tomcat-autoheap
