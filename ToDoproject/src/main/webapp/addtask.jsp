<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
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
        }

        form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background-color: #1C445E;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-top: 120px;'
            
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
        #taskid{
        display: none;
            }
        label{
            color: white;
            }
     
    </style>
</head>
<body>
<%Dao dao=new Dao(); %>
    <h1>Add Task</h1>
    <form action="taskform" method="post">
        <label for="taskid"></label>
        <input type="text" id="taskid" name="taskid" value="<%=dao.getTaskId()%>" ><br>	
        
        <label for="tasktitle">Task Title:</label>
        <input type="text" id="tasktitle" name="tasktitle" class="form-control"><br>
        
        <label for="taskdescription">Task Description:</label>
        <input type="text" id="taskdescription" name="taskdescription" class="form-control"><br>
        
       <label for="taskpriority" style="display:none;">Task Priority:</label><br>
       <input type="radio" id="low" name="taskpriority" value="low" style="display:none;">
       <input type="radio" id="medium" name="taskpriority" value="medium" style="display:none;">
       <input type="radio" id="high" name="taskpriority" value="high" style="display:none;">
             
        <label for="taskdate">Task Due Date:</label>
        <input type="date" id="taskdate" name="taskdate" class="form-control">
        
        <input type="submit" class="btn btn-primary">	
    </form>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
