<%@page import="dao.Dao"%>
<%@page import="java.util.Base64"%>
<%@page import ="dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>profile update</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            background-image: url('image/pencil-1891732_1280.jpg');
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
            filter: blur(7px); /* Apply blur effect */
            opacity: 0.5; /* Set opacity */
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
            box-shadow: 0 4px 8px rgba(0,0,0,0.9); /* Added box shadow for a highlighted effect */
            display: inline-block;
            max-width: 500px;
            width: 100%;
            
            
         /* Light background color with transparency */
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

        img#previewImage {
            margin-top: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        #id {
            display: none;
        }
        #image{
        margin-left: 120px;
        }
    </style>
</head>
<body>
<%Dao dao=new Dao();
User user = (User) request.getAttribute("userData");%>
 
    <div class="container">
        
        <form action="updateprofile" enctype="multipart/form-data" method="post">
        <h1>profile update</h1>
            <input type="hidden" id="id" name="id" value="<%=user.getUserid()%>"><br>
            <div class="mb-3">
                <label for="name" class="form-label"></label>
                <input type="text" class="form-control" id="name" placeholder="name" name="name" value="<%=user.getUsername()%>" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label"></label>
                <input type="email" class="form-control" id="email" placeholder="Email" name="email" value="<%=user.getUseremail()%>" required>
            </div>
            <div class="mb-3">
                <label for="contact" class="form-label"></label>
                <input type="text" class="form-control" id="contact" placeholder="contact" name="contact" value="<%=user.getUsercontact()%>" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label"></label>
                <input type="password" class="form-control" id="password" placeholder="password"name="password" value="<%=user.getUserpassword()%>" required>
            </div>
            <% String image = user.getUserimage() != null ? new String(Base64.getEncoder().encode(user.getUserimage())) : ""; %>
            <img id="previewImage" src="data:image/jpeg;base64,<%= image %>" width="150" height="100"><br>
            <div class="mb-3">
                <label for="image" class="form-label"></label>
                <input type="file" class="form-control" id="image" name="image" accept="image/*">
            </div>
                <div class="mb-3">
                    <input type="submit" class="btn btn-primary" value="update">
                   
                </div>
        </form>
    </div>
</body>
</html>
