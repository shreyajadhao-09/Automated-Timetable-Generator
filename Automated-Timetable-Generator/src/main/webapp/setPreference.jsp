<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="models.JavaFuns"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="soham"%>
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
   
    http.open('get', 'GetSubPref2?sub=' + st);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('pref2').innerHTML = response;
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
   
    http.open('get', 'GetSubPref3?sub=' + st);
    http.onreadystatechange = processResponse1;
    http.send(null);
}

function processResponse1() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('pref3').innerHTML = response;
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

%><div class="row">
<div class="col-md-6">

<h2>Set Elective Subject Preferences</h2>
<%
JavaFuns jf=new JavaFuns();
Vector v111=jf.getValue("select subjectName from  stud_sub_allocation where userid='"+session.getAttribute("userid").toString().trim()+"' and sem="+session.getAttribute("sem").toString().trim(), 1);
if(v111.size()>0)
{
	%>
 	 
<table class="table table-bordered"><tr><th>Allotted Subject name</th><th></th>
</tr>
<tr><td><%=v111.elementAt(0).toString().trim() %></td>
 <td>
<a href="ViewDocs?sem=<%=session.getAttribute("sem").toString().trim() %>&sub=<%=v111.elementAt(0).toString().trim() %>&branch=<%=session.getAttribute("branch").toString().trim() %>">View Study Material</a>
</td>
</table>
 
	<%
}
else
{
Vector v=jf.getValue("SELECT intake from preference_submission  where  CURDATE() between fromdt and todt", 1);
Vector v1=jf.getValue("select subName from subjects where semester="+session.getAttribute("sem").toString().trim()+" and branch='"+session.getAttribute("branch").toString().trim()+"' and course='"+session.getAttribute("course").toString().trim()+"'", 1);
 
if(v.size()>0)
{
	 int intake=Integer.parseInt(v.elementAt(0).toString().trim());
 session.setAttribute("intake", intake);
 %>
<form name="frm" method="post" action="setPreferences">
<table class="tblform">
	 
		<tr>
		<td>Preference 1</td>
		<td>
		
<select name="pref1" required class="form-control" onchange="makeGetRequest(this.value)">
<option value=""> <---Select---></option>
<%for(int i=0;i<v1.size();i++){
	//Vector v123=jf.getValue("select count(*) from stud_sub_allocation where subjectName='"+v1.elementAt(i).toString().trim()+"'", 1);
	//if(Integer.parseInt(v123.elementAt(0).toString().trim())<intake){		
			%>
<option value="<%=v1.elementAt(i).toString().trim() %>"><%=v1.elementAt(i).toString().trim() %></option>
<%//}
	} %>
</select>
</td>
	</tr>
	<tr>
		<td>Preference 2</td>
		<td><div id="pref2"></div></td>
	</tr>
		<tr>
		<td>Preference 3</td>
		<td><div id="pref3"></div></td>
	</tr>
	<tr>
		<td>
		<input type="submit" value="Submit">
		</td>
	</tr>
</table>
</form>
<%}else{ %>
<h2>Can't Set Preference Now!!</h2>
<%} %>


<%
}%></div> 
<div class="col-md-6">
<center><h2>Elective Subjects</h2></center>
<table class="table table-bordered">
<tr style="background-color:seashell">
<th>Subject Name</th>  
</tr>


<soham:forEach items="${std}" var="rec">

<tr>
<td> ${rec.subjectName}  </td>
 
  
</tr>
</soham:forEach>
</table>
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