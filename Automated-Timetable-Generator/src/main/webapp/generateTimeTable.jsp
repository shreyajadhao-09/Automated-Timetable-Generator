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

%><div class="row">
<div class="col-md-12">

<h2>Generate Time Table</h2>
<form name="frm" method="post" action="GenerateTimeTable">
<table class="tblform">
	<!-- <tr>
		<td>Branch ID</td>
		<td><input type="text" name="branchid" required></td>
	</tr> -->
		 
	<tr>
		<td>Branch Name</td>
		<td>
		<select name="branchname" required class="form-control">
		<option value=""><---Select---></option> 
		 <%
		 List<RegisterBranch> lst=(List<RegisterBranch>)request.getAttribute("lstbranch");
		 for(int i=0;i<lst.size();i++)
		 {
			 RegisterBranch br=(RegisterBranch)lst.get(i);
			 %><option value="<%=br.getBranchname() %>"><%=br.getBranchname() %></option><%
		 }
		 %>	</select>
		</td>
	</tr><tr>
	<td>Semester</td>
		<td>
 <select required name="semester" class="form-control" >
<option value=""><---Select---></option> 
<% 
 int nosem=8; 
 for(int i=1;i<=nosem;i++)
{%>
<option value="<%=i %>"><%=i %></option>											
<%}%>
 

</select></td></tr>
	<tr>
		<td>
		<input type="submit" value="Submit">
		</td>
	</tr>
</table>
</form></div> 
 
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