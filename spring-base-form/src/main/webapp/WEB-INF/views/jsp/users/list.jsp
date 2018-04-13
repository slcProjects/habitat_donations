<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
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

			<h1>All Users</h1>
			<c:choose>
				<c:when test="${empty users}">
					<p>No users found</p>
				</c:when>
				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>#ID</th>
								<th>LoginName</th>
								<th>Email</th>
								<th>Role</th>
								<th>Actions</th>
							</tr>
						</thead>

						<c:forEach var="user" items="${users}">
							<tr>
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
				</c:otherwise>
			</c:choose>

			<spring:url value="/users/add" var="urlAddUser" />
			<button class="btn btn-info" onclick="location.href='${urlAddUser}'">Add
				New User</button>
			<spring:url value="/users/searchform" var="userSearch" />
			<button class="btn btn-info" onclick="location.href='${userSearch}'">User Search</button>
			<spring:url value="/donations" var="donationUrl" />
			<button class="btn btn-info" onclick="location.href='${donationUrl}'">Received
				Donations</button>
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