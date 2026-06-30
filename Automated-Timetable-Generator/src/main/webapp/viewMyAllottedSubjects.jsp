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
<h2>My Allotted Subjects</h2>
<hr>

<table class="table table-bordered">
<tr style="background-color:seashell">
<th>Branch</th>
<th>Course</th>
<th>Semester</th>
<th>Subject Name</th> 
<th>Date</th>
<th></th> <th></th> <th></th> 
</tr>


<soham:forEach items="${std}" var="rec">

<tr>
<td>${rec.branchname}</td>
<td>${rec.courseName}</td>
<td>${rec.semester}</td>
<td>${rec.subjectName}</td>
<td>${rec.dt}</td> 
<td>
<a   href="getTimeTable?branch=<%=session.getAttribute("branch").toString().trim() %>&sem=${rec.semester}">Time Table</a>
</td>
<td>
<a href="viewstudent2?sem=${rec.semester}&sub=${rec.subjectName}&branch=${rec.branchname}">View Students</a>
</td>
<td>
<a href="UploadDoc?sem=${rec.semester}&sub=${rec.subjectName}&branch=${rec.branchname}">Upload Study Material</a>
</td>
 <td>
<a href="ViewDocs?sem=${rec.semester}&sub=${rec.subjectName}&branch=${rec.branchname}">View Study Material</a>
</td>

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