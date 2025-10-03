<%--
  Created by IntelliJ IDEA.
  User: AL MASUD
  Date: 9/30/2025
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Library Management System - Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }
        .welcome-text {
            color: #555;
            font-size: 18px;
            margin-bottom: 40px;
            line-height: 1.6;
        }
        .navigation-buttons {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 30px;
        }
        .nav-button {
            background-color: #3498db;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s;
            border: none;
            cursor: pointer;
        }
        .nav-button:hover {
            background-color: #2980b9;
        }
        .add-book-btn {
            background-color: #27ae60;
        }
        .add-book-btn:hover {
            background-color: #229954;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Library Management System</h1>

        <div class="welcome-text">
            <p>Your digital gateway to managing books, tracking inventory, and organizing your library efficiently.</p>
            <p>Whether you're adding new books to your collection or browsing through existing titles,
               our system makes library management simple and intuitive.</p>
            <p>Get started by choosing one of the options below:</p>
        </div>

        <div class="navigation-buttons">
            <a href="/books" class="nav-button">View Book List
            </a>
            <a href="/addBook" class="nav-button add-book-btn">
                 Add New Book
            </a>
        </div>
    </div>
</body>
</html>
