# Step 1: Build the project using Maven and Java 21
FROM maven:21

WORKDIR /app

COPY GradeCalculator.java .

# Install app dependencies
RUN javac GradeCalculator.java

CMD ["java", "GradeCalculator"]