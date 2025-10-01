<%--
  Created by IntelliJ IDEA.
  User: AL MASUD
  Date: 9/30/2025
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<h2 style="text-align: center; margin-top: 30px;">Register New Book</h2>
<c:if test="${not empty apiMessage}">
    <p style="text-align:center;
            color: ${apiMessage.contains('invalid') ? 'red' : 'green'};
            font-weight:bold;
            margin-bottom: 20px;">
            ${apiMessage}
    </p>
</c:if>


<form action="${pageContext.request.contextPath}/add" method="post" class="book-form">
    <div class="form-group">
        <label for="bookName">Book Name:</label>
        <input type="text" id="bookName" name="bookName" placeholder="Enter book name" required>
    </div>

    <div class="form-group">
        <label for="bookAuthor">Author:</label>
        <input type="text" id="bookAuthor" name="bookAuthor" placeholder="Enter author name" required>
    </div>

    <div class="form-group">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" placeholder="Enter quantity" required>
    </div>

    <button type="submit" class="submit-btn">Add Book</button>
</form>

<style>
    .book-form {
        width: 400px;
        margin: 20px auto;
        padding: 25px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f9f9f9;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .book-form .form-group {
        margin-bottom: 15px;
        display: flex;
        flex-direction: column;
    }

    .book-form label {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .book-form input {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        transition: border-color 0.3s;
    }

    .book-form input:focus {
        border-color: #007bff;
        outline: none;
    }

    .book-form .submit-btn {
        width: 100%;
        padding: 12px;
        background-color: #007bff;
        color: white;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .book-form .submit-btn:hover {
        background-color: #0056b3;
    }
</style>
</html>
