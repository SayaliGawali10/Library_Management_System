<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add, Search, and Delete Students</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
    body {
        background-image: url("images/student.jpeg");
        background-repeat: no-repeat;
        background-size: cover;
        color: #ffffff;
        font-family: Arial, sans-serif;
    }
    .card-custom {
        background-color: rgba(255, 255, 255, 0.85);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        margin-top: 50px;
    }
    .form-label {
        color: #007bff; 
        font-weight: bold;
    }
    .form-title {
        color: #ff5733; 
        font-size: 2rem;
        font-weight: bold;
    }
    .btn-primary {
        background-color: #007bff;
        border: none;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .search-box {
        margin-top: 20px;
    }
    .search-label {
        color: #007bff;
        font-weight: bold;
    }
    .search-input {
        width: 300px;
        margin-right: 10px;
    }
    .student-list {
        margin-top: 30px;
    }
    table {
        width: 100%;
    }
    th, td {
        text-align: center;
    }
</style>
</head>
<body>

<div class="container text-end mt-3">
    <a href="javascript:void(0);" onclick="logoutUser()">
        <button class="btn btn-outline-primary">
            Logout
        </button>
    </a>
</div>

<script>
    function logoutUser() {
  
        sessionStorage.clear();  
        localStorage.clear();   
        window.location.href = 'login.jsp';  
    }
</script>

    <div class="container">
        
        <div class="card-custom">
            <h2 class="text-center form-title">
                <i class="bi bi-search"></i> Search Student by ID
            </h2>
            <form action="SearchStudent" method="get" class="search-box text-center">
                <label for="searchId" class="search-label">Enter Student ID to Search:</label>
                <input type="text" id="searchId" name="id" class="form-control search-input" placeholder="Search by Student ID" required>
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-search"></i> Search
                </button>
            </form>

            
            <div class="student-list">
                <c:if test="${not empty searchedStudent}">
                    <h3 class="text-center">Search Result</h3>
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Contact</th>
                                <th>Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${searchedStudent.id}</td>
                                <td>${searchedStudent.name}</td>
                                <td>${searchedStudent.email}</td>
                                <td>${searchedStudent.contact}</td>
                                <td>${searchedStudent.address}</td>
                            </tr>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>

       
        <div class="card-custom">
            <h2 class="text-center form-title">
                <i class="bi bi-person-plus"></i> Add New Student
            </h2>
            <form action="AddStudent" method="post">
                <div class="mb-3">
                    <label for="studentId" class="form-label">Student ID</label>
                    <input type="text" class="form-control" id="studentId" name="studentId" placeholder="Enter Student ID" required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter Full Name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email Address" required>
                </div>
                <div class="mb-3">
                    <label for="contact" class="form-label">Contact Number</label>
                    <input type="text" class="form-control" id="contact" name="contact" placeholder="Enter Contact Number" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <textarea class="form-control" id="address" name="address" placeholder="Enter Address" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="borrowedBook" class="form-label">Borrowed Book</label>
                    <select class="form-control" id="borrowedBook" name="borrowedBook" required>
                        <option value="" disabled selected>Select a book</option>
                        <option value="Java">Java</option>
                        <option value="Python">Python</option>
                        <option value="C">C</option>
                        <option value="C++">C++</option>
                        <option value=".NET">.NET</option>
                        <option value="OOPs">OOPs</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="returnDate" class="form-label">Return Date</label>
                    <input type="date" class="form-control" id="returnDate" name="returnDate" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Add Student
                    </button>
                </div>
            </form>
        </div>

       
        <div class="card-custom">
            <h2 class="text-center form-title">
                <i class="bi bi-list"></i> All Students
            </h2>
            <c:if test="${not empty students}">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Select</th>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Address</th>
                            <th>Borrowed Book</th>
                            <th>Return Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${students}">
                            <tr>
                                <td>
                                    <input type="radio" name="selectedStudentId" value="${student.id}" required>
                                </td>
                                <td>${student.id}</td>
                                <td>${student.name}</td>
                                <td>${student.email}</td>
                                <td>${student.contact}</td>
                                <td>${student.address}</td>
                                <td>${student.borrowedBook}</td>
                                <td>${student.returnDate}</td>
                                <td>
                                   
                                    <form action="ChangeBook" method="post" class="d-inline">
                                        <input type="hidden" name="id" value="${student.id}">
                                        <button type="submit" class="btn btn-sm btn-primary">
                                            <i class="bi bi-arrow-repeat"></i> Change Book
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty students}">
                <p class="text-center form-label">No students available</p>
            </c:if>
        </div>

        
        <div class="card-custom">
            <h2 class="text-center form-title">
                <i class="bi bi-trash"></i> Delete Student
            </h2>
            <form action="DeleteStudent" method="post" class="text-center">
                <label for="deleteId" class="form-label">Enter Student ID to Delete:</label>
                <input type="text" id="deleteId" name="id" class="form-control search-input" placeholder="Enter Student ID" required>
                <button type="submit" class="btn btn-danger mt-3">
                    <i class="bi bi-trash"></i> Delete
                </button>
            </form>
            <c:if test="${not empty deleteMessage}">
                <p class="text-center text-success">${deleteMessage}</p>
            </c:if>
        </div>
    </div>
</body>

</html> 