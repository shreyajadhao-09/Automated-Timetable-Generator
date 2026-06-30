  
<%@page import="models.Subjects"%>
<%@page import="java.util.List"%>
<%@page import="models.Courses"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="soham"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<title>Register</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body> 
  <jsp:include page="Top.jsp"></jsp:include>
  <center><h2>Subjects</h2></center>
<table class="table table-bordered">
<tr style="background-color:seashell">
<th>Subject Name</th> 
<th>  </th>
</tr>


<soham:forEach items="${std}" var="rec">

<tr>
<td> ${rec.subjectName}  </td>
 
 <td>
<a href="viewDocs1?sem=<%=session.getAttribute("sem").toString().trim() %>&sub=${rec.subjectName} &branch=<%=session.getAttribute("branch").toString().trim() %>">View Study Material</a>
</td> 
</tr>
</soham:forEach>
</table>
</body>
</html>