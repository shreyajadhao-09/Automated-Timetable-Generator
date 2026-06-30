<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="beans.*" %>
<%@page import="models.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" href="css/cust.css">

<title> </title>
</head>
<%
	BranchList bl = new BranchList();
	List<BranchList> lst = bl.getBranchList();
	List<Staff> lstst=(ArrayList)request.getAttribute("std");
%>
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

%>
  <div class="row">
<div class="col-md-6">

<h2>Edit Profile</h2>
 

<div class="form-group">
<form name="frm" method="post" action="updatestaff" enctype="multipart/form-data"><table class="tblform">
	<tr><td>Userid</td>
	<td><input type="text" name="userid" class="form-control"  value='<%=lstst.get(0).getUserid() %>' disabled="disabled" required></td>
	</tr>
	<tr><td>User Name</td>
	<td><input type="text" name="usernm" class="form-control" value='<%=lstst.get(0).getUsernm() %>' required></td>
	</tr>
	 <tr><td>User Type<td>
	 Staff
	 </td>
       <tr><td>Mobile Number</td>
       	<td><input type="text" name="mobileno"  pattern="^\d{10}$" value='<%=lstst.get(0).getMobileno() %>' class="form-control" required></td></tr>
       <tr>
		<td>Email Address</td>       
       <td><input type="text" name="emailid" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  value='<%=lstst.get(0).getEmailid() %>' class="form-control" required></td>
       </tr>
       
       <tr>
       	<td>Branch</td>
       	<td><%=lstst.get(0).getBranch() %>  </td>
       	
       </tr>
       <tr>
       	<td>Date Of Birth</td>
       	<td><input type="date" name="dob" value='<%=lstst.get(0).getDob() %>'   class="form-control"></td>
       </tr>
       
        <tr><td>Photo</td>
       <td>
       <input type="file" name="file" class="form-control"/>
       </td></tr>
       <input type="text" name="userstatus" value="active" hidden="true">
       
	<tr>
	<td><input type="submit" value="Submit" class="btn btn-primary" ></td>
	</tr>
	</table>
</form>
</div></div>
<div class="col-md-6">
<img src="img/editprofile.png" width="80%"/>
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