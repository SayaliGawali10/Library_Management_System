<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add, Search, and Delete Books</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
    body {
        background-image: url("images/books.jpeg");
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
    .book-list {
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
    <div class="container">
        
        <div class="card-custom">
            <h2 class="text-center form-title">
                <i class="bi bi-search"></i> Search Book by ID
            </h2>
           <form action="SearchBook" method="get" class="search-box text-center">
    <label for="searchId" class="search-label">Enter Book ID to Search:</label>
    <input type="text" id="searchId" name="id" class="form-control search-input" placeholder="Search by Book ID" required>
    <button type="submit" class="btn btn-primary">
        <i class="bi bi-search"></i> Search
    </button>
</form>

           
            <div class="book-list">
                <c:if test="${not empty searchedBook}">
                    <h3 class="text-center">Search Result</h3>
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Book ID</th>
                                <th>Title</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${searchedBook.id}</td>
                                <td>${searchedBook.title}</td>
                                <td>${searchedBook.quantity}</td>
                            </tr>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>

        
        <div class="card-custom">
            <h2 class="text-center form-title">
                <i class="bi bi-book"></i> Add New Book
            </h2>
            <form action="AddBook" method="post">
                <div class="mb-3">
                    <label for="bookId" class="form-label">Book ID</label>
                    <input type="text" class="form-control" id="bookId" name="bookId" placeholder="Enter Book ID" required>
                </div>
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="Enter Book Title" required>
                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter Quantity" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Add Book
                    </button>
                </div>
            </form>
        </div>

       
        <div class="card-custom">
            <h2 class="text-center form-title">
                <i class="bi bi-book"></i> All Books
            </h2>
            <c:if test="${not empty books}">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Title</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td>${book.id}</td>
                                <td>${book.title}</td>
                                <td>${book.quantity}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty books}">
    <p class="text-center form-label">No books available</p>
</c:if>
            
        </div>

        
        <div class="card-custom">
            <h2 class="text-center form-title">
                <i class="bi bi-trash"></i> Delete Book
            </h2>
            <form action="DeleteBook" method="post" class="text-center">
                <label for="deleteId" class="form-label">Enter Book ID to Delete:</label>
                <input type="text" id="deleteId" name="id" class="form-control search-input" placeholder="Enter Book ID" required>
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
