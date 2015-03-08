<%@page import="example.Database"%>
<%
String equationtitle=request.getParameter("EquationTitle");
Database obj=new Database();
String result;
obj.setEquationtitle(equationtitle);
obj.CreateConnection();
result=obj.fetchMathML();
out.println(result);
%>
