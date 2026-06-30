  
<%@page import="models.Subjects"%>
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
  <div class="row">
   
<%
int courseId=Integer.parseInt(request.getAttribute("courseId").toString().trim());
int semester=Integer.parseInt(request.getAttribute("semester").toString().trim());
String branch= (request.getAttribute("branch").toString().trim());
//cities to be generated from the DB later
Subjects obj=new Subjects();
obj.setCourseId(courseId);
obj.setBranchname(branch);
obj.setSemester(semester);
obj.getSubjects_pendingEle1();

 List<Subjects> lst=obj.getLstsub(); 
 for(int i=0;i<lst.size();i++)
{%>
 			<div class="col-md-3">
  <%=((Subjects)lst.get(i)).getSubjectName() %> 
  Allotted Students: <%= %>
  </div>								
<%}%>
 </div>
 
</body>
</html>