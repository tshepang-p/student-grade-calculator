FROM tomcat:9.0-jdk11

# Set memory limit for Render free tier
ENV JAVA_OPTS="-Xmx256m"

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file - rename to ROOT.war for root context
COPY target/grade-calculator.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
