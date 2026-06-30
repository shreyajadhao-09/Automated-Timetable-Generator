  
<%@page import="java.util.List"%>
<%@page import="models.Courses"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 <select required name="semester" class="form-control" >
<option value=""><---Select---></option> 
<%
int courseId=Integer.parseInt(request.getParameter("courseId").trim());

//cities to be generated from the DB later
Courses obj=new Courses();
obj.setCourseId(courseId);
obj.getSemesters();
 int nosem=obj.getSemNo(); 
 for(int i=1;i<=nosem;i++)
{%>
<option value="<%=i %>"><%=i %></option>											
<%}%>
 

</select>
</body>
</html>