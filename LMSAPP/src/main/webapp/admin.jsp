<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
    body {
        background-image: url("images/lib.jpeg");
        background-repeat: no-repeat; 
        background-size: cover;
        color: #ffffff;
        font-family: Arial, sans-serif;
    }
    .navbar-custom {
        background-color: rgba(0, 0, 0, 0.7);
        border-radius: 10px;
        padding: 10px;
        text-align: center;
    }
    .btn-custom {
        margin: 10px;
        background-color: #007bff;
        border: none;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 150px;
        height: 50px;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    .btn-custom i {
        margin-right: 8px;
        font-size: 20px;
    }
    .btn-custom:hover {
        background-color: #0056b3;
    }
    .card-custom {
        background-color: rgba(255, 255, 255, 0.85);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        margin-top: 50px;
    }
    .footer {
        background-color: rgba(0, 0, 0, 0.7);
        color: #ffffff;
        text-align: center;
        padding: 20px;
        border-radius: 10px;
        margin-top: 30px;
    }
    .footer a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }
    .footer a:hover {
        color: #0056b3;
        text-decoration: underline;
    }
    .highlight {
        color: #ffcc00; 
        font-weight: bold;
    }
</style>
</head>
<body>
    <div class="container">
       
        <div class="card-custom text-center mt-5">
            <marquee behavior="scroll" direction="left"><h3><span class="highlight">Welcome To The Library</span></h3></marquee>
        </div>

        <div class="card-custom text-center">
           
            <div class="navbar-custom">
                <h1 class="text-white">Library Management</h1>
            </div>
           
            <div class="d-flex justify-content-center mt-4">
                <a href="addBooks.jsp" class="btn btn-custom">
                    <i class="bi bi-book"></i> Books
                </a>
                <a href="addstudent.jsp" class="btn btn-custom">
                    <i class="bi bi-people"></i> Students
                </a>
            </div>
        </div>
    </div>
</body>
</html>
