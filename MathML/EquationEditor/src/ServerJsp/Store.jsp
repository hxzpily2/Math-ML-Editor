<%@page import="example.Database"%>
<%
String uid=request.getParameter("uid");
String username=request.getParameter("username");
String equationtitle=request.getParameter("equationtitle");
String mathML=request.getParameter("mathml");
Database obj=new Database();
obj.setUID(uid);
obj.setUsername(username);
obj.setEquationtitle(equationtitle);
obj.setmathML(mathML);
obj.CreateConnection();
obj.StoreRecord();
%>