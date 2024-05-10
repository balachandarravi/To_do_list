<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color:#0D1D29;
            color:white;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url("https://www.istockphoto.com/photo/hd-wallpaper-for-mobile-phones-gm1257005098-368232610?utm_source=pixabay&utm_medium=affiliate&utm_campaign=SRP_image_sponsored&utm_content=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2F4k%2520wallpaper%2F&utm_term=4k+wallpaper");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .container {
            text-align: center;
        }
        .btn {
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s, color 0.3s;
        }
        .btn-primary:hover {
            background-color: #1C445E;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>TO-DO LIST</h1>
        <p>Choose an option</p>
        <a href="login.jsp" class="btn btn-primary">Login</a>
        <a href="signup.jsp" class="btn btn-primary">Signup</a>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
