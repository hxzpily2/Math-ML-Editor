<%@page import="example.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List;"%>
<%
String titles="<?xml version=\"1.0\" encoding=\"UTF-8\"?><root>";
List returnvalue=new ArrayList();
String username=request.getParameter("username");
Database obj=new Database();
obj.setUsername(username);
obj.CreateConnection();
returnvalue=obj.RetrieveRecord();
for(int i=0;i<returnvalue.size();i++)
{
	titles=titles+"<name>"+returnvalue.get(i)+"</name>";	
}
titles=titles+"</root>";
out.println(titles);
%>