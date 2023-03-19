FROM tomcat:9
ENV CATALINA_HOME="/usr/local/tomcat9"
RUN mkdir -p $CATALINA_HOME
WORKDIR $CATALINA_HOME
ADD *.war $CATALINA_HOME/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]