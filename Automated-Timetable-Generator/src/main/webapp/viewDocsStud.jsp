
 
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js" type="text/javascript"></script>
      <!--// plugin-specific resources //-->
        <script src='rating/jquery.js' type="text/javascript"></script>
	<script src='rating/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
 <script src='rating/jquery.rating.js' type="text/javascript" language="javascript"></script>
 <link href='rating/jquery.rating.css' type="text/css" rel="stylesheet"/>
 <!--// documentation resources //-->
 <!--<script src="http://code.jquery.com/jquery-migrate-1.1.1.js" type="text/javascript"></script>-->
 
</head>
<body>
<jsp:include page="Top.jsp"></jsp:include>
<% try{ response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("home");
}
 
%>
<div class="container-fluid">
   

       
<div class="row">
 
<div class="col-md-12">
  <center><h2>Tutorials</h2></center>
   <table class="table table-bordered">
 <tr>
 <th> Title</th> <th>Description</th>
 <th>Userid</th>

 <th>Date</th>
 <th>Time
 <th>Course</th>
  <th></th>
   
 </tr>
 <c:forEach var="userdsc" items="${lst}">
		 <tr>
		<td>${userdsc.getDoctitle() }</td>
		<td>${userdsc.getDocDesc() }</td>
		<td>${userdsc.getUserid() }</td>
		<td>${userdsc.getDt() }</td>
		<td>${userdsc.getTm() }</td>
		<td>${userdsc.course }</td>
		 
	 <td><a href='download.jsp?path=${userdsc.getDocpath() }&docid=${userdsc.getDocId() }&course=${userdsc.getCourse() }' target="_blank">Download</a></td>
		 
		 </tr>
		</c:forEach> 
		 
		
		</table>
  
 <center><h2>Other Documents</h2></center>
   <table class="table table-bordered">
 <tr>
 <th> Title</th> <th>Description</th>
 <th>Userid</th>

 <th>Date</th>
 <th>Time
 <th>Course</th>
  <th></th>
   
 </tr>
 <c:forEach var="userdsc" items="${lst1}">
		 <tr>
		<td>${userdsc.getDoctitle() }</td>
		<td>${userdsc.getDocDesc() }</td>
		<td>${userdsc.getUserid() }</td>
		<td>${userdsc.getDt() }</td>
		<td>${userdsc.getTm() }</td>
		<td>${userdsc.course }</td>
		 
	 <td><a href='Uploads/${userdsc.getDocpath() }' target="_blank">Download</a></td>
		 
		 </tr>
		</c:forEach> 
		 
		
		</table>
<%
}
catch(Exception ex)
{
	
} 
 %>  
</div>
</div>
 


</div>
</body>
</html>