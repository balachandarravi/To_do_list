<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dao.Dao"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    background-image: url('image/register.JPEG');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    position: relative; /* Add position relative to body */
}

/* Create an overlay pseudo-element */
body::before {
    content: "";
    background: inherit;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    filter: blur(10px); /* Apply blur effect */
    opacity: 0.6; /* Set opacity */
    z-index: -1; /* Send it behind the body content */
}

.container {
    text-align: center;
}

form {

    margin-top: 40px; /* Increased top margin */
    margin-bottom: 50px; /* Increased bottom margin */
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0,0,1,0.9); /* Added box shadow for a highlighted effect */
    display: inline-block;
    max-width: 400px;
    width: 100%;
}
        input[type="text"], input[type="email"], input[type="password"], input[type="file"], input[type="submit"] {
            padding: 10px;
            margin-bottom: 20px; /* Increased margin between input fields */
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            background-color: transparent; /* Make background transparent */
            border: none; /* Remove border */
            border-bottom: 1px solid #ccc; /* Add bottom border */
            outline: none; /* Remove outline */
            font-size: 16px;
            font-weight: bold;
        }
        input[type="text"]::placeholder, input[type="email"]::placeholder, input[type="password"]::placeholder, input[type="file"]::placeholder {
            color: black; /* Placeholder color */
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            opacity: 0.8; /* Set opacity */
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a{
            text-decoration: none;
            color: #007bff;
        }
        .error-message {
            font-size: 16px;
            color: red;
            margin-bottom: 10px;
            color: #cc0000;
        }
        #image{
        margin-left: 100px;
           }
             .login:hover {
             color:#0056b3;
        }
    </style>
</head>
<body>
<%Dao dao=new Dao(); %>
    <div class="container">
        <form action="saveuser" method="post" enctype="multipart/form-data">
            <h1>User Registration</h1>
             <% if (request.getAttribute("messages") != null) { %>
                <span class="error-messages"><%= "user already exist ! try another mail"%>&nbsp;<br></span><br>
            <% } %>
            <input type="hidden" name="id" value="<%= dao.getUserId()%>">
            <div class="row">
                <div class="col">
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" name="name" class="form-control" placeholder="Enter your Name" required="">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="text" name="email" class="form-control" placeholder="Enter your Email" required="">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                        <input type="text" name="contact" class="form-control" placeholder="Enter your Contact" required="">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" name="password" class="form-control" placeholder="Enter your Password" required="">
                    </div>
                </div>
            </div>
            <div class="row">
    <div class="col">
        <label for="image" class="form-label">Choose your Image</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-image"></i></span>
            <input type="file" name="image" id="image" class="form-control" accept="image/*" required="">
        </div>
    </div>
</div>
            <div class="row">
                <div class="col">
                    <input type="submit" class="btn btn-primary" value="Register">
                    Already an user? <a class="login" href="login.jsp">LOGIN</a>
                </div>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
