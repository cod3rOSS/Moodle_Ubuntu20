#!/bin/bash
#load common script and check programs

. common_script.sh
check_program javac
check_program java
get_source_files java

#compile all .java files

export CLASSPATH=$CLASSPATH:./junit-4.12.jar:./hamcrest-core-1.3.jar:./assertj-core-3.11.1.jar
javac -J-Xmx16m -Xlint:deprecation *.java

if [ "$?" -ne "0" ] ; then

  echo "Not compiled"
  exit 0

fi

cat common_script.sh > vpl_execution
echo "java -enableassertions -cp $CLASSPATH:./junit-4.12.jar:./hamcrest-core-1.3.jar:./assertj-core-3.11.1.jar org.junit.runner.JUnitCore HelloTests" >> vpl_execution
chmod +x vpl_execution