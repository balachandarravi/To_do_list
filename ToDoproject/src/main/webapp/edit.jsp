<%@page import="dto.Task"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #0D1D29;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            padding: 20px;
            background-color: #343a40;
            color: white;
            margin-bottom: 0;
        }

        form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background-color: #1C445E;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-top: 120px;
             color: white;
            
        }

        form input[type="text"],
        form input[type="date"],
        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ced4da;
            box-sizing: border-box;
        }

        form input[type="radio"] {
            margin-right: 10px;
        }

        form label {
            margin-bottom: 5px;
            display: block;
        }

        form input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        } 

        form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .hide {
            display: none;
        }
        lable{
        color: white;
        }
    </style>
</head>
<body>

 <h1>Edit Task</h1>
    <form action="edittask" method="GET">
        <input type="hidden" name="taskid" value="<%=request.getParameter("taskid")%>">	
        
        <div class="form-group">
            <label for="tasktitle">Task Title:</label>
            <input type="text" id="tasktitle" name="tasktitle" class="form-control" value="<%=request.getParameter("tasktitle") == null ? "" : request.getParameter("tasktitle").trim()%>">
        </div>
        
        <div class="form-group">
            <label for="taskdescription">Task Description:</label>
            <input type="text" id="taskdescription" name="taskdescription" class="form-control" value="<%=request.getParameter("taskdescription") == null ? "" : request.getParameter("taskdescription").trim()%>">
        </div>
        <input type="radio" class="hide" id="low" name="taskpriority" value="low" <%=request.getParameter("taskpriority") != null && request.getParameter("taskpriority").equals("low") ? "checked" : ""%>>
     
        <input type="radio"  class="hide" id="medium" name="taskpriority" value="medium" <%=request.getParameter("taskpriority") != null && request.getParameter("taskpriority").equals("medium") ? "checked" : ""%>>
        
        <input type="radio"  class="hide" id="high" name="taskpriority" value="high" <%=request.getParameter("taskpriority") != null && request.getParameter("taskpriority").equals("high") ? "checked" : ""%>>
        
   
        <div class="form-group">
            <label for="taskdate">Task Due Date:</label>
            <input type="date" id="taskdate" name="taskduedate" class="form-control" value="<%=request.getParameter("taskduedate") == null ? "" : request.getParameter("taskduedate")%>">
        </div>
           
        <div class="form-group">
            <label for="taskstatus">Task status:</label>
            <input type="text" id="taskstatus" name="taskstatus" class="form-control" value="<%=request.getParameter("taskstatus") == null ? "" : request.getParameter("taskstatus").trim()%>">
        </div>
        
        <input type="submit" value="Submit" class="btn btn-primary">	
    </form>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
