<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="models.JavaFuns"%>
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

%><div class="row">
<div class="col-md-6">


<%
JavaFuns jf=new JavaFuns();
Vector v=jf.getValue("select fromdt,todt,intake from preference_submission", 3);
String fromdt,todt,intake="30";
Date dt=new Date();
fromdt=dt.getDate()+"/"+(dt.getMonth()+1)+"/"+(dt.getYear()+1900);
todt=fromdt;
if(v.size()>0)
{
	fromdt=v.elementAt(0).toString().trim();
	todt=v.elementAt(1).toString().trim();
	intake=v.elementAt(2).toString().trim();
}
 %><h2>Register Preference Submission Dates</h2>
<form name="frm" method="post" action="regpreferences">
<table class="tblform">
	 
		<tr>
		<td>From Date</td>
		<td><input type="date" value="<%=fromdt %>" name="fromdt" class="form-control" required></td>
	</tr>
	<tr>
		<td>To Date</td>
		<td><input type="date" value="<%=todt %>" name="todt" class="form-control" required></td>
	</tr>
	<tr>
		<td>Intake</td>
		<td><input type="text" value="<%=intake %>" name="intake" class="form-control" required></td>
	</tr>
	<tr>
		<td>
		<input type="submit" value="Submit">
		</td>
	</tr>
</table>
</form></div> 
<div class="col-md-6">
<h2>Set Algorithm</h2>
<form name="frm" method="post" action="setAlgo">
<table class="tblform">
	 
		<tr>
		<td>Algorithm</td>
		<td>
		<select name="algo" class="form-control" required>
		<option value=""><---Select---></option>
		<option value="FCFS">First Come First Serve</option>
		<option value="RoundRobin">Round Robin</option>		
		<option value="Priority">Priority-Based Allocation </option> 
		</select>
		</td>
	</tr>
	 
	<tr>
		<td>
		<input type="submit" value="Submit">
		</td>
	</tr>
</table>
</form>
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
	
}
%>
 
</body>
</html>