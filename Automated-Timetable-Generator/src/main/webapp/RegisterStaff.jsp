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

%>  <div class="row">
<div class="col-md-6">

<h2>Register Staff</h2>
 

<div class="form-group">
<form name="frm" method="post" action="registernewstaff"><table class="tblform">
	<tr><td>Userid</td>
	<td><input type="text" name="userid" class="form-control" required></td>
	</tr>
	<tr><td>User Name</td>
	<td><input type="text" name="usernm" class="form-control" required></td>
	</tr>
	<tr><td>Password</td>
	<td><input type="password" name="pswd" class="form-control" required></td>
	</tr>
	 <input type="text" name="usertype" value="staff" hidden="true">
	 
       <tr><td>Mobile Number</td>
       	<td><input type="text" name="mobileno" class="form-control"  pattern="^\d{10}$" required></td></tr>
       <tr>
		<td>Email Address</td>       
       <td><input type="text" name="emailid" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  class="form-control" required></td>
       </tr>
       <tr>
       	<td>Gender</td>
       	<td><input type="radio" name="gender" value="male"> Male
			<input type="radio" name="gender" value="female"> Female<br></td>
       </tr>
       <tr>
       	<td>Branch</td>
       	<td><select name="branch" class="form-control" required>
       	<%for(int i=0 ;i<lst.size();i++) {%>
       			<option value=<%=lst.get(i).getBranchname()%>><%=lst.get(i).getBranchname() %></option>
		<%} %>
       	</select></td>
       	
       </tr>
       <tr>
       	<td>Date Of Birth</td>
       	<td><input type="date" name="dob" class="form-control"></td>
       </tr>
       <input type="text" name="userstatus" value="active" hidden="true">
       
	<tr>
	<td><input type="submit" value="Submit" class="btn btn-primary" ></td>
	</tr>
	</table>
</form>
</div></div>
<div class="col-md-6">
<img src="img/staffreg.jpg"  />
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