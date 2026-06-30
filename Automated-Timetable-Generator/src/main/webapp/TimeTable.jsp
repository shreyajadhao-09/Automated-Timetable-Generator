<%@page import="java.util.Vector"%>
<%@page import="models.JavaFuns"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.RegisterBranch"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" href="css/cust.css">

<title> </title>
</head>
<body><jsp:include page="Top.jsp"></jsp:include>
<% try{ response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
} 

String userid=String.valueOf(session.getAttribute("userid"));

if(!userid.equalsIgnoreCase("null")){	
	
session.setMaxInactiveInterval(10*60);
JavaFuns jf=new JavaFuns();
String sem,branch;
sem=request.getAttribute("sem").toString().trim();
branch=request.getAttribute("branch").toString().trim();

Vector v=jf.getValue("select * from timetable where sem="+sem+" and branch='"+branch.trim()+"' limit 1", 4);

%><div class="row">
<div class="col-md-12">

<h2>Time Table</h2>
<h3>Branch : <%=branch %> | Semester : <%=sem %></h3> 
<%for(int i=0;i<v.size();i=i+4){ %>
<%=v.elementAt(i+3).toString().trim() %>
<%} %>
</div> 
 
</div>
<%
}
else{
	%>
	<h2>Invalid Session...Login again</h2>
	<br>
	<a href="index.jsp">Login</a>
	
		<%
}}
catch(Exception ex)
{
	System.out.println("errr in regcouse="+ex.getMessage());
}
%>
 
</body>
</html>