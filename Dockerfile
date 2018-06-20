FROM java:8-jre-alpine
MAINTAINER li.jamling@gmail.com
ENV RESERVED_MEGABYTES 16
COPY entrypoint.sh /bin/java2
COPY hello.jar /
RUN chmod +x /bin/java2
