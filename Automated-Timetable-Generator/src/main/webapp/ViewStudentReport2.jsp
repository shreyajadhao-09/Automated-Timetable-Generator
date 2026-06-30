<%@page import="models.LoginTracker"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="soham"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" href="css/cust.css">

<title> </title>
</head>
<body><jsp:include page="Top.jsp"></jsp:include>
<%

String userid=String.valueOf(session.getAttribute("userid"));
String usertype=String.valueOf(session.getAttribute("usertype"));
if(!userid.equalsIgnoreCase("null")){	
	
session.setMaxInactiveInterval(10*60);
LoginTracker login=new LoginTracker();
%>
<h2>Student Report</h2>
<hr>

<table class="table table-bordered">
<tr style="background-color:seashell">
<th>UserId</th>
<th>UserName</th>
<th>Allotted Subject</th>
<th>Preference 1</th>
<th>Preference 2</th>
<th>Preference 3</th>

<th>Mobile Number</th>
<th>Email ID</th>
<th>Gender</th>
<th>Branch</th>
<th>Course</th>
<th>Semester</th> 
 
</tr>


<soham:forEach items="${std}" var="rec">

<tr>
<td>${rec.userid}</td>
<td>${rec.usernm}</td>
 <td>${rec.sub}</td>
<td>${rec.pref1}</td>
<td>${rec.pref2}</td>
<td>${rec.pref3}</td>
<td>${rec.mobileno}</td>
<td>${rec.emailid}</td>
<td>${rec.gender}</td>
<td>${rec.branch}</td>
<td>${rec.course}</td>
<td>${rec.semester}</td>
 
 
 
</tr>

</soham:forEach>
</table>

<%
if(usertype.equals("admin")){
%> 
<%
}
else{	%>
	 
<%
	}
	
}
else{
	%>
	<h2>Invalid Session...Login again</h2>
	<br>
	<a href="index.jsp">Login</a>
	
	<%
}

%>
</body>
</html>