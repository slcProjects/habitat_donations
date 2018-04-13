<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/head.jsp" />
<body>
	<jsp:include page="../fragments/header.jsp" />
	<div class="content_body" style="margin-top: 156px">
		<div class="container">

			<c:if test="${not empty msg}">
				<div class="alert alert-${css} alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>${msg}</strong>
				</div>
			</c:if>

			<h1>User Search Results</h1>
			<c:choose>
				<c:when test="${empty users}">
					<p>No users found</p>
				</c:when>
				<c:otherwise>
					<spring:url value="/users/email" var="userEmail" />
					<form method="post" action="${userEmail}">
						<table>
							<thead>
								<tr>
									<th>Check to Email User</th>
									<th>#ID</th>
									<th>LoginName</th>
									<th>Email</th>
									<th>Role</th>
									<th>Actions</th>
								</tr>
							</thead>
	
							<c:forEach var="user" items="${users}">
								<tr>
									<td><input name="usersend" type="checkbox" value="${user.id}"/></td>
									<td>${user.id}</td>
									<td>${user.loginName}</td>
									<td>${user.email}</td>
									<td>${user.role}</td>
									<td><spring:url value="/users/${user.id}" var="userUrl" />
										<spring:url value="/users/${user.id}/delete" var="deleteUrl" />
										<spring:url value="/users/${user.id}/update" var="updateUrl" />
										<spring:url value="/donations/${user.id}/add" var="donateUrl" />
										<button onclick="location.href='${userUrl}'">View
											Detail</button>
										<button onclick="location.href='${updateUrl}'">Edit
											User</button>
										<button onclick="location.href='${deleteUrl}'">Delete</button>
										<button onclick="location.href='${donateUrl}'">Donate</button>
									</td>
								</tr>
							</c:forEach>
						</table>
						<button type="submit">Email Selected Users</button>
					</form>
				</c:otherwise>
			</c:choose>

			<spring:url value="/users/searchform" var="userSearch" />
			<button class="btn btn-info" onclick="location.href='${userSearch}'">User Search</button>
			<spring:url value="/users" var="urlAddUser" />
			<button class="btn btn-info" onclick="location.href='${urlAllUser}'">View All Users</button>
			<spring:url value="/dashboard" var="dashboardUrl" />
			<button class="btn btn-info"
				onclick="location.href='${dashboardUrl}'">Staff Dashboard</button>
			<spring:url value="/logout" var="logoutUrl" />
			<button class="btn btn-info" onclick="location.href='${logoutUrl}'">Log
				Out</button>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>