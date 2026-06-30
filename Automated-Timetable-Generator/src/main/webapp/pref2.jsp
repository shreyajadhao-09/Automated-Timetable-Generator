<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="models.JavaFuns"%>
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
<body>  
<%
JavaFuns jf=new JavaFuns();
 Vector v1=jf.getValue("select subName from subjects where subName<>'"+request.getParameter("sub").trim()+"' and semester="+session.getAttribute("sem").toString().trim()+" and branch='"+session.getAttribute("branch").toString().trim()+"' and course='"+session.getAttribute("course").toString().trim()+"'", 1);
 session.setAttribute("pref2", request.getParameter("sub").trim());
 	 
 int intake=Integer.parseInt(session.getAttribute("intake").toString().trim());
 %> 
		
<select name="pref2" required class="form-control" onchange="makeGetRequest1(this.value)">
<option value=""> <---Select---></option>
<%for(int i=0;i<v1.size();i++){ 
	//Vector v123=jf.getValue("select count(*) from stud_sub_allocation where subjectName='"+v1.elementAt(i).toString().trim()+"'", 1);
	//if(Integer.parseInt(v123.elementAt(0).toString().trim())<intake){		
	
%>
<option value="<%=v1.elementAt(i).toString().trim() %>"><%=v1.elementAt(i).toString().trim() %></option>
<%//}
	} %>
</select>
 
	 
   
 
</body>
</html>