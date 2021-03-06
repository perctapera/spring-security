<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Spring Security - Home</title>
	</head>
	<body>
		<h2>Welcome to the Homepage.</h2>
		<hr>
		<p>
			Logged on user: <security:authentication property="principal.username"/>
			<br><br>
			Roles: <security:authentication property="principal.authorities"/>
		</p>
		
		
		<security:authorize access="hasRole('MANAGER')"> <!-- Show content in this tag only to managers -->
			<hr>
			<!-- Link for leaders -->
			<p>
				<a href="${pageContext.request.contextPath}/leaders">Leadership</a>
				(Only for managers)
			</p>
		</security:authorize>
		
		<security:authorize access="hasRole('ADMINISTRATOR')">
			<!-- Link for admins -->
			<p>
				<a href="${pageContext.request.contextPath}/systems">Admin Page</a>
				(Only for Administrators)
			</p>
		</security:authorize>
		<hr>
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="Logout" />
		</form:form>
	</body>
</html>