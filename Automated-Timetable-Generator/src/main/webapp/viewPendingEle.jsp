<%@page import="models.Staff"%>
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

<script language="Javascript" type="text/javascript">
 

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest(st) {
   // st=document.frm.state.value;
   
    http.open('get', 'CoursesPendingEle?branch=' + st);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('courses').innerHTML = response;
    }
}
 
</script>

<script language="Javascript" type="text/javascript">
 

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest1(st) {
   // st=document.frm.state.value;
   
    http.open('get', 'Semesters1-pendingEle?courseId=' + st);
    http.onreadystatechange = processResponse1;
    http.send(null);
}

function processResponse1() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('sem').innerHTML = response;
    }
}
 
</script>

<script language="Javascript" type="text/javascript">
 

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest2(st) {
	//alert('in makeget2');
     courseId=document.frm.courseId.value;
     semester=document.frm.semester.value;
     branch=document.frm.branchname.value;
     //alert(courseId+" sem="+semester+" branch="+branch);
    http.open('get', 'ShowSubjects_PendingEle?semester=' + semester+"&courseId="+courseId+"&branch="+branch);
    http.onreadystatechange = processResponse2;
    http.send(null);
}

function processResponse2() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('subjects').innerHTML = response;
    }
}

function makeGetReqEle() {
	 //alert('in makegete2');
     courseId=document.frm.courseId.value;
     semester=document.frm.semester.value;
     branch=document.frm.branchname.value;
      
      //alert(courseId+" sem="+semester+" branch="+branch);
    http.open('get', 'ShowPendingStudEle?semester=' + semester+"&courseId="+courseId+"&branch="+branch);
    http.onreadystatechange = processResponse333;
    http.send(null);
}

function processResponse333() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('stud').innerHTML = response;
    }
}


</script>
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

%><div class="row"><form name="frm" id="frm" method="post" action="AllocateSubjectEle">

<div class="col-md-12">

<h2>Elective Subject Allocation</h2>
<table class="tblform">
	<!-- <tr>
		<td>Branch ID</td>
		<td><input type="text" name="branchid" required></td>
	</tr> -->
		 
	<tr>
		 
		<td >
		<select name="branchname" required class="form-control" onchange="makeGetRequest(this.value)">
		<option value=""><---Select Branch---></option> 
		 <%
		 List<RegisterBranch> lst=(List<RegisterBranch>)request.getAttribute("lstbranch");
		 for(int i=0;i<lst.size();i++)
		 {
			 RegisterBranch br=(RegisterBranch)lst.get(i);
			 %><option value="<%=br.getBranchname() %>"><%=br.getBranchname() %></option><%
		 }
		 %>	</select>
		</td>
	
	 
	<td >
	<div id="courses" name="courses"> 
	<select name="123" class="form-control">
	<option value=""><--select Course--></option>
	</select>
	</div>
	</td>
	 
	 
	<td >
	<div id="sem" name="sem">
	<select name="123" class="form-control">
	<option value=""><--select Semester--></option>
	</select></div>
	</td>
	 <td>
		<input type="button" onclick="makeGetReqEle()" value="Show Pending Students">
		</td>
	 </tr><tr><td>select subject to allocate</td>
	<td>
	<div id="subjects" name="subjects">
	<select name="123" class="form-control">
	<option value=""><--select Subject--></option>
	</select></div>
	</td>
	 
		<td>
		<input type="submit" name="action" value="Allocate">
		</td>
		<td>
		<input type="submit" name="action" value="Send Notification">
		</td>
	</tr>
</table>
</div> 
 <div id="stud" name="stud"></div></form>
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