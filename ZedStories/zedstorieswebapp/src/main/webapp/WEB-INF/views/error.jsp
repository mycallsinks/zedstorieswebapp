<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error 404 - Page Not Found</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            padding: 20px;
        }
        .error-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1 {
            color: #d9534f;
        }
        p {
            color: #333;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Error 404 - Page Not Found</h1>
        <p>Sorry, the page you are looking for cannot be found.</p>
        <p><a href="${pageContext.request.contextPath}/index">Back to Home</a></p>

    </div>
</body>
</html>
