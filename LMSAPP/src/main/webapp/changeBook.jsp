<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Change Borrowed Book</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background-image: url("images/change.jpeg");
        background-repeat: no-repeat;
        background-position: top center; 
        background-size: contain; 
        background-attachment: fixed; 
        color: #ffffff;
        font-family: 'Roboto', sans-serif;
        height: 100vh; 
        margin: 0;
        display: flex;
        justify-content: center; 
        align-items: center; 
        background-color: #000000; 
    }

    .container {
        width: 100%;
        max-width: 600px;
        background: rgba(0, 0, 0, 0.7); 
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    }

    .form-title {
        color: #ff5733;
        font-size: 1.8rem;
        font-weight: 600;
        text-align: center;
        margin-bottom: 20px;
    }

    .form-label {
        color: #007bff;
        font-weight: bold;
    }

    .btn-primary {
        background-color: #007bff;
        border: none;
        padding: 10px 20px;
        font-size: 1.1rem;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .form-control {
        border-radius: 8px;
        box-shadow: none;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }

    .text-center p {
        font-size: 1.2rem;
        color: #ff5733;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="card-custom">
            <h2 class="form-title">
                <i class="bi bi-arrow-repeat"></i> Change Borrowed Book
            </h2>

            <!-- Check if student exists and has borrowed a book -->
            <c:if test="${not empty st}">
                <!-- Check if the student has borrowed a book -->
                <c:if test="${not empty st.borrowedBook}">
                    <form action="/UpdateBook" method="post">
                        <input type="hidden" name="studentid" value="${st.id}">

                        <div class="form-group">
                            <label for="studentId" class="form-label">Student ID</label>
                            <input type="text" class="form-control" id="studentId" name="studentId" value="${st.id}" readonly>
                        </div>

                        <div class="form-group">
                            <label for="name" class="form-label">Student Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${st.name}" readonly>
                        </div>

                        <div class="form-group">
                            <label for="currentBook" class="form-label">Current Borrowed Book</label>
                            <input type="text" class="form-control" id="currentBook" name="currentBook" value="${st.borrowedBook}" readonly>
                        </div>

                        <div class="form-group">
                            <label for="newBook" class="form-label">Select New Book</label>
                            <select class="form-control" id="newBook" name="borrowedBook" required>
                                <option value="" disabled selected>Select a new book</option>
                                <option value="Java" ${st.borrowedBook == 'Java' ? 'selected' : ''}>Java</option>
                                <option value="Python" ${st.borrowedBook == 'Python' ? 'selected' : ''}>Python</option>
                                <option value="C" ${st.borrowedBook == 'C' ? 'selected' : ''}>C</option>
                                <option value="C++" ${st.borrowedBook == 'C++' ? 'selected' : ''}>C++</option>
                                <option value=".NET" ${st.borrowedBook == '.NET' ? 'selected' : ''}>.NET</option>
                                <option value="OOPs" ${st.borrowedBook == 'OOPs' ? 'selected' : ''}>OOPs</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="returnDate" class="form-label">New Return Date</label>
                            <input type="date" class="form-control" id="returnDate" name="returnDate" required>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-arrow-repeat"></i> Change Book
                            </button>
                        </div>
                    </form>

                    <!-- Button to remove the book -->
                    <form action="/RemoveBook" method="post" style="margin-top: 20px;">
                        <input type="hidden" name="id" value="${st.id}">
                        <div class="text-center">
                            <button type="submit" class="btn btn-danger">
                                <i class="bi bi-trash"></i> Remove Book
                            </button>
                        </div>
                    </form>
                </c:if>

                <!-- If the student has not borrowed a book, show a message -->
                <c:if test="${empty st.borrowedBook}">
                    <p class="text-center">This student has not borrowed any books. Please borrow a book first.</p>
                    <form action="/BorrowBook" method="post">
                        <input type="hidden" name="studentid" value="${st.id}">
                        <div class="form-group">
                            <label for="newBook" class="form-label">Select Book to Borrow</label>
                            <select class="form-control" id="newBook" name="borrowedBook" required>
                                <option value="" disabled selected>Select a book to borrow</option>
                                <option value="Java">Java</option>
                                <option value="Python">Python</option>
                                <option value="C">C</option>
                                <option value="C++">C++</option>
                                <option value=".NET">.NET</option>
                                <option value="OOPs">OOPs</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="returnDate" class="form-label">Return Date</label>
                            <input type="date" class="form-control" id="returnDate" name="returnDate" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-book"></i> Borrow Book
                            </button>
                        </div>
                    </form>
                </c:if>
            </c:if>

            <!-- If student is not found -->
            <c:if test="${empty st}">
                <p class="text-center">Student not found. Please go back and try again.</p>
            </c:if>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8Fq4VxW+Jfo5lB0baT3wIMgiIuZUGRiT1bfh5vJj04M9Xp" crossorigin="anonymous"></script>
</body>
</html>