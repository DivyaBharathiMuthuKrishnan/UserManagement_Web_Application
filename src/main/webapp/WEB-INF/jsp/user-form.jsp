<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
<title>User Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: blue">
			<div>
				<a href="https://www.xadmin.net" class="navbar-brand"> User Management Application </a>
			</div>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="container">
		<h3 class="text-center">
			<c:choose>
				<c:when test="${user.id == 0}">
					Add New User
				</c:when>
				<c:otherwise>
					Edit User
				</c:otherwise>
			</c:choose>
		</h3>
		<hr>

		<form action="${pageContext.request.contextPath}/save" method="post">
			<input type="hidden" name="id" value="${user.id}" />

			<div class="form-group">
				<label>Name:</label>
				<input type="text" class="form-control" name="name" value="${user.name}" required>
			</div>

			<div class="form-group">
				<label>Email:</label>
				<input type="email" class="form-control" name="email" value="${user.email}" required>
			</div>

			<div class="form-group">
				<label>Country:</label>
				<input type="text" class="form-control" name="country" value="${user.country}" required>
			</div>

			<button type="submit" class="btn btn-success">Save</button>
			<a href="${pageContext.request.contextPath}/list" class="btn btn-secondary">Cancel</a>
		</form>
	</div>

</body>
</html>

