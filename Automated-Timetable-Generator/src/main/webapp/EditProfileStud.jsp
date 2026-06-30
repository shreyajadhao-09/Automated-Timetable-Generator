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

<title>  </title>
</head>
<body><jsp:include page="Top.jsp"></jsp:include>
 <div class="row"> <div class="col-md-6"> 
<%
 try{
 	BranchList bl = new BranchList();
 	List<BranchList> lst = bl.getBranchList();
 	List<Student> lstst=(ArrayList)request.getAttribute("std");
 %>

<h2>My Profile</h2>
 
<hr>

<div class="form-group">
<form name="frm" method="post" action="updateuser" enctype="multipart/form-data"><table class="tblform">
	<tr><td>Userid</td>
	<td><input type="text" name="userid" value='<%=lstst.get(0).getUserid() %>' disabled="disabled" class="form-control" required></td>
	</tr>
	<tr><td>User Name</td>
	<td><input type="text" name="usernm" value='<%=lstst.get(0).getUsernm() %>' class="form-control" required></td>
	</tr>
	 
	 <tr>
                    <td>Usertype</td>
                    <td><%=lstst.get(0).getUsertype() %>         </td>
                </tr>
       <tr><td>Mobile Number</td>
       	<td><input type="text" name="mobileno"  pattern="^\d{10}$" class="form-control" value='<%=lstst.get(0).getMobileno()%>' required></td></tr>
       <tr>
		<td>Email Address</td>       
       <td><input type="text" name="emailid" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  value='<%=lstst.get(0).getEmailid() %>' required></td>
       </tr>
      
        
       <tr>
       	<td>Branch</td>
       	<td> <%=lstst.get(0).getBranch()  %> </td>
       	
       </tr>
       <tr>
       	<td>Semester</td>
       	<td><select name="semester" required class="form-control"  value='<%=lstst.get(0).getSemester() %>'>
       				<option value="<%=lstst.get(0).getSemester() %>"><%=lstst.get(0).getSemester() %></option>
       				<option value="1">1</option>
       				<option value="2">2</option>                   
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option> 
                    
                    
                        </select> </td>
       </tr>
       <tr>
       	<td>Date Of Birth</td>
       	<td><input type="date" name="dob" class="form-control" value='<%=lstst.get(0).getDob() %>'></td>
       </tr>
       <tr><td>Photo</td>
       <td>
       <input type="file" name="file" class="form-control"/>
       </td></tr>
	<tr>
	<td><input type="submit" value="Submit" class="btn btn-primary" ></td>
	</tr>
	</table>
</form>
</div></div><div class="col-md-6"><br/><br/>
<img src="img/editprofile.png" width="80%"/>
</div>
</div></div>
<%}catch(Exception ex){
	System.out.println("err="+ex.getMessage());
} %>
}
</body>
</html>