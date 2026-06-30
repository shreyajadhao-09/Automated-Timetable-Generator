<%@page import="java.util.List"%>
<%@page import="beans.BranchList"%>
<%@page import="java.util.Vector"%>
<%@page import="models.JavaFuns"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enhanced Profile Page</title>
     
    <style>
    .edu-link{
    font-size: 22px;
    }
        .popup-form {
            display: none; /* hidden by default */
            position: fixed;
            top: 60%;
            left: 50%;
            
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border: 2px solid #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 10;
            width:500px!important;
        }
		.close-popup {
		float:right;
		}
        .popup-form h4 {
            margin-bottom: 15px;
        }
p{
font-weight: bold;
}
        .popup-form input, .popup-form select {
            display: block;
            width: 80%;
            padding: 10px;
            margin-bottom: 10px;
        }

        

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9;
        }
    </style>
</head>
<body><jsp:include page="Top2.jsp"></jsp:include>
<div class="overlay"></div>

<div class="row">
    <div class="col-md-12"> 
        <div class="main-content"> 
            <div class="section">
                <div class="main-container" id="maincontainer">
                    <div class="info-section" id="education">
                        <h2>Education Profile</h2><br>

                        <% JavaFuns jf = new JavaFuns(); %>
                        <% Vector vgrd = jf.getValue("select college,percent,passing_yr,course from academics where course<>'HSC' and course<>'SSC' and userid='" + session.getAttribute("userid").toString().trim() + "'", 4); %>
                        <% 
                        int sem=Integer.parseInt(session.getAttribute("sem").toString().trim());
                        sem=sem-1;
                        if (vgrd.size() == 0) {
                        	if(sem==0){
                        		%><%
                        		
                        	}else{%>
                            <p><a href="#" class="edu-link" data-target="#graduationForm">Add Graduation Details</a></p>
                            
                        <% }} else { %>
                        <h4><a href="#" class="edu-link" data-target="#graduationForm">Add Graduation Details</a></h4>
                            <h3>Graduation Marks</h3>
                           <table class="table table-bordered"><tr><th>Semester</th><th> Scored Percentage</th><th>Passing Year</th></tr>
                         
                           <%for(int i=0;i<vgrd.size();i=i+4) { %>
                            <tr> <td><%= vgrd.elementAt(i+3).toString().trim() %> </td> <td><%= vgrd.elementAt(i+1).toString().trim() %>%</td>
                            <td><%= vgrd.elementAt(i+2).toString().trim() %></td>
                            </tr>
                            <%} %>
                            </table> 
                            
                        <% } %>

                        <% Vector vhsc = jf.getValue("select college,percent,passing_yr from academics where course='HSC' and userid='" + session.getAttribute("userid").toString().trim() + "'", 3); %>
                        <% if (vhsc.size() == 0) { %>
                            <p><a href="#" class="edu-link" data-target="#classXIIForm">Add Class XII Details</a></p>
                            
                        <% } else { %>
                           <h3>HSC from <%= vhsc.elementAt(0).toString().trim() %></h3>
                           <table class="table table-bordered"><tr><th> Scored Percentage</th><th>Passing Year</th></tr><tr>
                            <td><%= vhsc.elementAt(1).toString().trim() %>%</td><td><%= vhsc.elementAt(2).toString().trim() %></td>
                            </tr></table>    <% } %>

                        <% Vector vssc = jf.getValue("select college,percent,passing_yr from academics where course='SSC' and userid='" + session.getAttribute("userid").toString().trim() + "'", 3); %>
                        <% if (vssc.size() == 0) { %>
                            <p><a href="#" class="edu-link" data-target="#classXForm">Add Class X Details</a></p>
                             
                        <% } else { %>
                            <h3>SSC from <%= vssc.elementAt(0).toString().trim() %></h3>
                           <table class="table table-bordered"><tr><th> Scored Percentage</th><th>Passing Year</th></tr><tr>
                            <td><%= vssc.elementAt(1).toString().trim() %>%</td><td><%= vssc.elementAt(2).toString().trim() %></td>
                            </tr></table>
                        <% } %>

                        <!-- Popup Forms -->
                        <div id="graduationForm" class="popup-form">
                        <button class="close-popup btn btn-secondary">Close</button>
                            <h4>Education: Graduation</h4>
                            <form method="post" action="RegGrad">
                                <label>Semester</label>
                                  <input type="text" name="sem" value="<%=sem %>" class="form-control"/>
                               
                                <label>Branch:</label> 
                                <input type="text" name="branch" value="<%=session.getAttribute("branch").toString().trim() %>" class="form-control"/>
                                <%
                                    BranchList bl1 = new BranchList();
                                    List<BranchList> lst1 = bl1.getBranchList();
                                %>
                           
                                <label>Percentage:</label>
                                <input type="text" required name="grad-percentage">
                                <label>Year:</label>
                                <input type="text" required name="grad-year">
                                <input type="submit" value="Submit">
                            </form>
                            
                        </div>

                        <div id="classXIIForm" class="popup-form">
                        <button class="close-popup btn btn-secondary">Close</button>
                            <h4>Education: Class XII</h4>
                            <form method="post" action="RegXIIDetails">
                                <label>College Name:</label>
                                <input type="text" name="xii-school" required>
                                <label>Percentage:</label>
                                <input type="text" name="xii-percentage" required>
                                <label>Passing Year:</label>
                                <input type="text" name="xii-year" required>
                                <button type="submit">Submit</button>
                            </form>
                            
                        </div>

                        <div id="classXForm" class="popup-form">
                        <button class="close-popup btn btn-secondary">Close</button>
                            <h4>Education: Class X</h4>
                            <form method="post" action="RegXDetails">
                                <label>School:</label>
                                <input type="text" name="x-school" required>
                                <label>Percentage:</label>
                                <input type="text" name="x-percentage" required>
                                <label>Passing Year:</label>
                                <input type="text" name="x-year" required>
                                <button type="submit">Submit</button>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript to handle popups -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.edu-link').forEach(function (link) {
        link.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(link.getAttribute('data-target'));
            if (target) {
                target.style.display = 'block';
                document.querySelector('.overlay').style.display = 'block';
            }
        });
    });

    document.querySelectorAll('.close-popup').forEach(function (button) {
        button.addEventListener('click', function () {
            this.parentElement.style.display = 'none';
            document.querySelector('.overlay').style.display = 'none';
        });
    });
});
</script>

</body>
</html>
