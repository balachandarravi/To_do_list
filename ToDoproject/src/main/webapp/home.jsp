<%@page import="java.util.Base64"%>
<%@page import="dto.User"%>
<%@page import="dao.Dao"%>
<%@page import="dto.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar With Bootstrap</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
   

    <style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

::after,
::before {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

a {
    text-decoration: none;
}

li {
    list-style: none;
}

h1 {
    font-weight: 600;
    font-size: 1.5rem;
}

body {
    font-family: 'Poppins', sans-serif;
    display: flex;
    background-color:  #1C445E;
}

.wrapper {
    display: flex;   
}

.main {
    min-height: 100vh;
    width: 100%;
    overflow: hidden;
    transition: all 0.35s ease-in-out;
    background-color: #fafbfe;
}

#sidebar {
    width: 70px;
    min-width: 70px;
    z-index: 1000;
    transition: all .25s ease-in-out;
    background-color: #0e2238;
    display: flex;
    position:relative;
    flex-direction: column;
}

#sidebar.expand {
    width: 290px;
    min-width: 290px;
}

.toggle-btn {
    background-color: transparent;
    cursor: pointer;
    border: 0;
    padding: 1rem 1.5rem;
}

.toggle-btn i {
    font-size: 1.5rem;
    color: #FFF;
}

.sidebar-logo {
    margin: auto 0;
}

.sidebar-logo a {
    color: #FFF;
    font-size: 1.15rem;
    font-weight: 600;
}

#sidebar:not(.expand) .sidebar-logo,
#sidebar:not(.expand) a.sidebar-link span {
    display: none;
}

.sidebar-nav {
    padding: 2rem 0;
    flex: 1 1 auto;
}

a.sidebar-link {
    padding: .625rem 1.625rem;
    color: #FFF;
    display: block;
    font-size: 0.9rem;
    white-space: nowrap;
    border-left: 3px solid transparent;
}

.sidebar-link i {
    font-size: 1.1rem;
    margin-right: .75rem;
}

a.sidebar-link:hover {
    background-color: rgba(255, 255, 255, .075);
    border-left: 3px solid #3b7ddd;
}

.sidebar-item {
    position: relative;
}

#sidebar:not(.expand) .sidebar-item .sidebar-dropdown {
    position: absolute;
    top: 0;
    left: 70px;
    background-color: #0e2238;
    padding: 0;
    min-width: 17rem;
    display: none;
}

#sidebar:not(.expand) .sidebar-item:hover .has-dropdown+.sidebar-dropdown {
    display: block;
    max-height: 15em;
    width: 100%;
    opacity: 1;
}

#sidebar.expand .sidebar-link[data-bs-toggle="collapse"]::after {
    border: solid;
    border-width: 0 .075rem .075rem 0;
    content: "";
    display: inline-block;
    padding: 2px;
    position: absolute;
    right: 1.8rem;
    top: 1.4rem;
    transform: rotate(-135deg);
    transition: all .2s ease-out;
}

#sidebar.expand .sidebar-link[data-bs-toggle="collapse"].collapsed::after {
    transform: rotate(45deg);
    transition: all .2s ease-out;
}

 table {
        width: 50%;
        margin: 20px auto;
        border-collapse: collapse;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        text-align: center;
        background-color: #83A5F4;
        margin-top: 100px;       
    }

    th,td {
        padding: 2px;
        border: 1px solid #ccc;
        color: #001D38;
    }

    th {
        background-color: #f8f8f8;
        font-weight: bold;
    }
    td:hover{
    background-color: #1D3352;
    color: white;
    }

    img {  
        margin: 20px auto;
        border-radius: 110px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.6);
        width: 100px
    }
       
    #gap{
    background-color: #1C445E;
    position: relative;
    }
    #move{
    width: 70%;    
    }
    #task{
    margin-left: 450px;   
    }
    #h1{
    margin-left: 400px;  
    }
    
    
   

.navdiv {
  border:1px solid black;
  width:100%;
  display: flex;
  justify-content: center;
  background-color: #0E2238;
  text-align: center;
  border-radius: 10px;

  
}

.bar {
  padding: 10px 50px;
  margin: 0 10px;
  cursor: pointer;
  transition: background-color 0.3s, color 0.3s;
  
}

.bar a:hover {
  background-color: #83A5F4;
  color:black;
  border-radius: 5px;
  
}
   
    </style>
</head>

<body>
<% User user=(User)request.getSession().getAttribute("user");%>
<% String username=user.getUsername();%>
<% String image=new String(Base64.getEncoder().encode(user.getUserimage())); %>
    <div class="wrapper">
        <aside id="sidebar">
            <div class="d-flex">
                <button class="toggle-btn" type="button">
                    <i class="lni lni-grid-alt"></i>
                </button>
                <div class="sidebar-logo">
                    <a >user profile</a>
                </div>
            </div>
            <ul class="sidebar-nav">
            
            <li class="sidebar-item">
                    <a class="sidebar-link">
                        <i class=""></i>
                        <span><img alt="" src="data:image/jpeg;base64,<%= image %> " width="50" height="100"></span>
                    </a>
                </li>
                
                       <li class="sidebar-item">
                    <a href="updateprofileolddata?useremail=<%=user.getUseremail()%>"class="sidebar-link">
                        <i class="lni lni-pencil-alt"></i>
                        <span>update profile</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a  class="sidebar-link">
                        <i class="lni lni-user"></i>
                        <span><%= username %></span>
                    </a>
                </li>
                

                    <li class="sidebar-item">
                    <a class="sidebar-link">
                        <i class="lni lni-phone"></i>
                        <span><%= user.getUsercontact()%></span>
                    </a>
                </li>
                        <li class="sidebar-item">
                    <a class="sidebar-link">
                        <i class="lni lni-envelope"></i>
                        <span><%= user.getUseremail()%></span>
                    </a>
                </li>
             
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                        data-bs-target="#auth" aria-expanded="false" aria-controls="auth">
                        <i class="lni lni-protection"></i>
                        <span>Auth</span>
                    </a>
                    <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="logout" class="sidebar-link">Login</a>
                        </li>

                    </ul>
                </li>
          
                
            </ul>
            <div class="sidebar-footer">
                <a href="logout" class="sidebar-link">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>
        <div id="gap" class="main p-3">          
        </div>
    </div>
    
 <div id="move"class="container">
 <div class="navdiv">
 <div class="bar" id="home"><a href="index.jsp">HOME</a></div>
 <div class="bar" id="login"><a href="logout">LOGIN</a></div>
 <div class="bar" id="logout"><a href="logout">LOGOUT</a></div>
 </div>

<%   Dao dao =new Dao(); %>
<% List<Task> tasks = (List)dao.getalltask(user.getUserid()); %>

<table class="table table-striped table-bordered">

    <tr>
        <th>sno</th>
        <th>title</th>
        <th>description</th>
        <th>priority</th>
        <th>due date</th>  
        <th>status</th>
        <th>delete</th>
        <th>edit</th>
    </tr>
    <% int counter = 1; %>
    <% for(Task task : tasks){%>
        <tr>
            <td><%= counter %></td>
            <td><%= task.getTasktitle()%></td>
            <td><%= task.getTaskdescription()%></td>
            <td><%= task.getTaskpriority()%></td>
            <td><%= task.getTaskduedate()%></td>
            <td><%= task.getTaskstatus()%></td>
            <td><a href="deletetask?taskid=<%=task.getTaskid()%>">Delete</a></td>
            <td><a href="edit.jsp?taskid=<%=task.getTaskid()%>&tasktitle=<%=task.getTasktitle().trim()%>&taskdescription=<%= task.getTaskdescription()%>&taskpriority=<%= task.getTaskpriority()%>&taskduedate=<%=task.getTaskduedate()%>&taskstatus=<%=task.getTaskstatus()%>">edit</a></td>
        </tr>
         <% counter++; %>
    <% } %>  
</table>
<a href="addtask.jsp" id="task" class="btn btn-primary mt-3">Add Task</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script>
        const hamBurger = document.querySelector(".toggle-btn");

hamBurger.addEventListener("click", function () {
  document.querySelector("#sidebar").classList.toggle("expand");
});
    </script>
</body>

</html>