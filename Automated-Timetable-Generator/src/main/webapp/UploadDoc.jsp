
 
<%@page import="models.Courses"%>
<%@page import="java.util.List"%>

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 

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

function makeGetRequestCD1(st) {
   // st=document.frm.state.value;
    
    http.open('get', 'ShowTopics2?courseId=' + st);
    http.onreadystatechange = processResponseCD1;
    http.send(null);
}

function processResponseCD1() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('topics').innerHTML = response;
    }
}
 
</script>
</head>
<body>
<jsp:include page="Top.jsp"></jsp:include>
<% try{ response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
%>
 

     
<div class="row">

<div class="col-md-12"> <h2>UPload Document</h2>
   <div class="form-group"> 
    <form method="post" name="frm" action="RegDocs" enctype="multipart/form-data">
<table class="tblform">

<tr>
		<td>Subject Name</td>
		<td>
		 <input type="text" name="sub" readonly="readonly" value="<%=request.getAttribute("sub").toString().trim() %>" class="form-control"></input>
		</td>
	</tr>
	 <tr>
		<td>Branch Name</td>
		<td>
		 <input type="text" name="branch" readonly="readonly" value="<%=request.getAttribute("branch").toString().trim() %>" class="form-control"></input>
		</td>
	</tr>
	  <tr>
		<td>Semester</td>
		<td>
		 <input type="text" name="sem" readonly="readonly" value="<%=request.getAttribute("sem").toString().trim() %>" class="form-control"></input>
		</td>
	</tr>
<tr><td>Title</td><td>
    <input type="text" name="doctitle" class="form-control"></input>
     </td></tr><tr><td>Description</td><td>
  <input type="text" name="docDesc" class="form-control"></input>
     
 </td></tr><tr><td>File</td><td>
    <input type="file" name="file" class="form-control"  ></input>
 </td></tr>
 <tr><td>Category</td>
 <td>
 <select name="category" required class="form-control">
 <option value=""><--select--></option>
 <option value="Tutorial">Tutorial</option>
 <option value="Notes">Notes</option>
 <option value="Videos">Video</option>
 <option value="Other">Other</option>
 </select>
 </td></tr>
 <tr><td colspan="2">
    <input type="submit" value="Submit" />
    </td></tr>
 
</table></form>
 
</div></div>
 
</div>
</div>
<%}
catch(Exception ex)
{
	
} %>

</div>
</body>
</html>