<%--
  Created by IntelliJ IDEA.
  User: AL MASUD
  Date: 9/30/2025
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: white;
            padding: 50px;
            border-radius: 25px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 600px;
            width: 90%;
            border: 1px solid #e0e0e0;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: #3498db;
            border-radius: 25px 25px 0 0;
        }

        .library-icon {
            font-size: 48px;
            color: #3498db;
            margin-bottom: 20px;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: 700;
            letter-spacing: -0.5px;
        }

        .welcome-text {
            color: #555;
            font-size: 18px;
            margin-bottom: 40px;
            line-height: 1.6;
            font-weight: 400;
        }

        .welcome-text p {
            margin-bottom: 15px;
        }

        .navigation-buttons {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .nav-button {
            background-color: #3498db;
            color: white;
            padding: 16px 32px;
            text-decoration: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            min-width: 160px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
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

        .stats-section {
            display: flex;
            justify-content: space-around;
            margin: 30px 0;
            padding: 20px 0;
            border-top: 1px solid rgba(0,0,0,0.1);
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 24px;
            font-weight: 700;
            color: #3498db;
            display: block;
        }

        .stat-label {
            font-size: 12px;
            color: #777;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="library-icon">
            <i class="fas fa-book-open"></i>
        </div>

        <h1>Welcome to Library Management</h1>

        <div class="welcome-text">
            <p>Hello! Here you can view all your books and add new ones to your collection.</p>
        </div>

        <div class="stats-section">
            <div class="stat-item">
                <span class="stat-number">${totalBooks}</span>
                <span class="stat-label">Available Books</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">24/7</span>
                <span class="stat-label">Available</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">Easy</span>
                <span class="stat-label">Management</span>
            </div>
        </div>

        <div class="navigation-buttons">
            <a href="/books" class="nav-button">
                <i class="fas fa-list"></i>
                View Books
            </a>
            <a href="/addBook" class="nav-button add-book-btn">
                <i class="fas fa-plus"></i>
                Add Book
            </a>
        </div>
    </div>
</body>
</html>