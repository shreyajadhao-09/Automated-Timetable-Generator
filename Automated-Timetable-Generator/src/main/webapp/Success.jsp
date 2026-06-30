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
<body><jsp:include page="DefaultTop.jsp"></jsp:include><div class="container"><center> 
<%

try{
String usertype="NA";
try{String userid="NA";
if(session.getAttribute("userid")!=null){
	userid=String.valueOf(session.getAttribute("userid"));
}
if(session.getAttribute("usertype")!=null){
usertype= String.valueOf(session.getAttribute("usertype"));
}
}
catch(Exception ex)
{
	
}

 
%>
<h2><%
if(request.getAttribute("activity").toString().trim().equals("branchReg"))
{
	%>
	Branch Registered Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("AlgoReg"))
{
	%>
	Algorithm Stored Successfully...
	
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("BAReg"))
{
	%>
	Branch Admin Registered Successfully...
	
	<%
}

else if(request.getAttribute("activity").toString().trim().equals("elenotification"))
{
	%>
	 Notification Sent Successfully... 
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("studsuballele"))
{
	%>
	Subject <b><%=request.getAttribute("sub").toString().trim() %></b> Allotted  Successfully...
	
	<%
}

else if(request.getAttribute("activity").toString().trim().equals("studsuball"))
{
	%>
	Subject <b><%=request.getAttribute("sub").toString().trim() %></b> Allotted  Successfully...
	
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("DocumentReg"))
{
	%>
	Document Uploaded Successfully...
	
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("prefReg"))
{
	%>
	Preference Submission Dates Registered Successfully...
	
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("StudReg"))
{
	%>
	You are Registered Successfully...
	
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("studsuball"))
{
	%>
	Subject <b><%=request.getAttribute("sub").toString().trim() %></b> Allotted  Successfully...
	
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("courseReg"))
{
	%>
	New Course Registered Successfully...
	
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("ExamDone"))
{
	%>
	Exam Completed Successfully...
	 
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("AnsReg"))
{
	%>
	Model Answer Registered Successfully...
	
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("StaffReg"))
{
	%>
	New Staff Member Registered Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("ExamReg"))
{
	%>
	Exam Registered Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("ExamQuesReg"))
{
	%>
	Exam Question Registered Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("SubReg"))
{
	%>
	New Subject Registered Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("SubAllocation"))
{
	%>
	Subject Allotted to Selected Staff Member Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("insertSesSubTopics"))
{
	%>
	Session sub topics Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("changePass"))
{
	%>
	Password Changed Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("QuesReg"))
{
	%>
	Question Registered Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("RegUnit"))
{
	%>
	New Unit Registered Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("studActivation"))
{
	%>
	Student Activation Done Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("SubmitExam"))
{
	%>
	Exam Scheduled Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("StaffProfile"))
{
	%>
	Your Profile Updated Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("insertExamQues"))
{
	%>
	Question Paper Generated Successfully...
	<%
}
else if(request.getAttribute("activity").toString().trim().equals("StudProfile"))
{
	%>
	Your Profile Updated Successfully...
	<%
}
%></h2>
<hr><br>
<%
if(request.getAttribute("activity").toString().trim().equals("StudReg"))
{%>
	<a href="index.jsp">Home</a>
<%}
else
{  
	if(usertype.equals("admin")){	%>
		<a href="Admin.jsp">Home</a>
		<%
	}
	else if(usertype.equals("student")){
		%>
		<a href="Student.jsp">Home</a>
		<%
	}else if(usertype.equals("branchadmin")){
		%>
		<a href="branchadmin.jsp">Home</a>
		<%
	}
	else if(usertype.equals("staff")){
	 if(request.getAttribute("activity").toString().trim().equals("ExamQuesReg"))
		{%>
		<a href="viewPendingExams">Continue...</a>
		<%
		}else{
		%>
		<a href="Staff.jsp">Home</a>
		<%}
	}
	else if(usertype.equals("exstudent")){
		%>
	<a href="ExStudent.jsp">Home</a>
<%
	}
	else {%>
		<a href="index.jsp">Home</a>
		<%
	}

}}
catch(Exception ex)
{
	System.out.println("errr="+ex.getMessage());
}%>
 &nbsp;
		<button onclick="history.back()" class="btn btn-primary">Go Back</button>
		
 
</body>
</html>