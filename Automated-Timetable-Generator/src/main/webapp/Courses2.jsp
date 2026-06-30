  
<%@page import="java.util.ArrayList"%>
<%@page import="models.Staff"%>
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
<body><tr><td colspan="2" >
 <select required name="courseId" class="form-control" onchange="makeGetRequest1(this.value)">
<option value=""><---Select Course---></option> 
<%
 
//cities to be generated from the DB later
Courses obj=new Courses();
obj.setBranchname(request.getAttribute("branch").toString().trim());
obj.getCourses();
List<Courses> lst=obj.getLstCourse();
  
 for(int i=0;i<lst.size();i++)
{%>
<option value="<%=lst.get(i).getCourseId() %>"><%=lst.get(i).getCourseName() %></option>											
<%}%>
 

</select>
<br/>
</td></tr> 
</body>
</html>