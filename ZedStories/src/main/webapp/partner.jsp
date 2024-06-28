<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Partner</title>
    <style>
        /* Your CSS styling here */
    </style>
</head>
<body>
    <h1>Partner</h1>
    <c:forEach var="post" items="${partners}">
        <div class="post">
            <h2>${post.title}</h2>
            <p><strong>Author:</strong> ${post.author}</p>
            <p><strong>Location:</strong> ${post.location}</p>
            <p>${post.text}</p>
            <c:if test="${not empty post.image}">
                <img src="uploads/${post.image}" alt="Post Image">
            </c:if>
            <p><strong>Contact Details:</strong> ${post.contactDetails}</p>
            <p><strong>Date:</strong> ${post.date}</p>
        </div>
    </c:forEach>
</body>
</html>
