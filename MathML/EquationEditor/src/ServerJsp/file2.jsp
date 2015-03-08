<!-- upload.jsp -->
<%@ page import="java.io.*" %>
<%
String contentType = request.getContentType();
DataInputStream in = new DataInputStream(request.getInputStream());

int formDataLength = request.getContentLength();

byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;

while (totalBytesRead < formDataLength)
{
byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
totalBytesRead += byteRead;
}
int i=1;
String file = new String(dataBytes);
String saveFile ="image"+i+".png";
i++; 
int lastIndex = contentType.lastIndexOf("=");
saveFile = "C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\blazeds_turnkey_3-0-0-544\\tomcat\\webapps\\blazeds\\Upload files\\" + saveFile;
FileOutputStream fileOut = new FileOutputStream(saveFile);
fileOut.write(dataBytes);
fileOut.flush();
fileOut.close();
%>