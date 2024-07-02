<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
</head>
<body>
	<h2>User Management Interface(for fiero only)</h2>

	<!-- Display existing users -->
	<h3>Existing Users:</h3>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Username</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.id}</td>
					<td>${user.username}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- Form to add new user -->
	<h3>Add New User:</h3>

	<form action="${pageContext.request.contextPath}/manageusers"
		method="post">

		<label for="username">Username:</label> <input type="text"
			id="username" name="username" required><br> <label
			for="password">Password:</label> <input type="password" id="password"
			name="password" required><br>

		<button type="submit">Add User</button>
	</form>

</body>
</html>
