<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
    <style>
        body { font-family: Arial, sans-serif; }
        h2 { text-align: center; margin-top: 20px; }
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #f4f4f4; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        tr:hover { background-color: #e2e2e2; }
        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 2px;
        }
        .borrow-btn {
            background-color: #28a745;
            color: white;
        }
        .borrow-btn:hover {
            background-color: #218838;
        }
        .return-btn {
            background-color: #ffc107;
            color: black;
        }
        .return-btn:hover {
            background-color: #e0a800;
        }
        .message {
            padding: 15px;
            margin: 20px auto;
            border-radius: 5px;
            width: 80%;
            text-align: center;
            font-weight: bold;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .message.error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .nav-links {
            text-align: center;
            margin: 20px auto;
            width: 80%;
        }
        .nav-btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 5px 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .nav-btn:hover {
            background-color: #0056b3;
        }
        .nav-btn.dashboard {
            background-color: #6c757d;
        }
        .nav-btn.dashboard:hover {
            background-color: #545b62;
        }
        .nav-btn.add-book {
            background-color: #28a745;
        }
        .nav-btn.add-book:hover {
            background-color: #218838;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #3498db;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .nav-container {
            text-align: center;
            margin: 20px auto;
            width: 80%;
        }
    </style>
</head>
<body>

<h2>Book List</h2>

<!-- Display API response message -->
<c:if test="${not empty apiMessage}">
    <div class="message ${apiMessage.contains('Error') ? 'error' : ''}">
        ${apiMessage}
    </div>
</c:if>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Book Name</th>
        <th>Author</th>
        <th>Quantity</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${not empty books}">
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.bookName}</td>
                    <td>${book.bookAuthor}</td>
                    <td>${book.quantity}</td>
                    <td>
                        <!-- Borrow Form -->
                        <form action="${pageContext.request.contextPath}/borrow/${book.id}" method="post" style="display:inline;">
                            <button type="submit" class="action-btn borrow-btn">Borrow</button>
                        </form>

                        <!-- Return Form -->
                        <form action="${pageContext.request.contextPath}/return/${book.id}" method="post" style="display:inline;">
                            <button type="submit" class="action-btn return-btn">Return</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="5">No books available</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<div class="nav-container">
    <a href="${pageContext.request.contextPath}/" class="back-link">← Back to Dashboard</a>
    <a href="${pageContext.request.contextPath}/addBook" class="back-link" style="margin-left: 20px;">📚 Add New Book</a>
</div>

</body>
</html>
