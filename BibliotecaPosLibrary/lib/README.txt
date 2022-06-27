How to install The Java Communications API
------------------------------------------

There  is  a trick to install the Java Communications API correctly on a Windows
system Machine. The following files are the core of JAVA Communiccation API, and
they are very important to have them installed  on  your  system  for  a  proper
operation:

    comm.jar
    javax.comm.properties
    win32com.dll

For  the  jdk  (Java  Developnment  Kit)  to  recognize the serial ports on your
machine, it is important to properly place these files in the right  folders  on
your local machine :

%JAVA_HOME% = the location of your jdk directory (C:/Java/jdk1.6.0_45)

comm.jar should be placed in:

    %JAVA_HOME%/lib
    %JAVA_HOME%/jre/lib

javax.comm.properties should be placed in:

    %JAVA_HOME%/lib
    %JAVA_HOME%/jre/lib

win32com.dll should be placed in:

    %JAVA_HOME%/bin
    %JAVA_HOME%/jre/bin
