<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

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

		<table style='border: 2px solid black'>
			<thead>
				<tr style='border: 2px solid black'>
					<th style='border: 2px solid black'>#ID</th>
					<th style='border: 2px solid black'>LoginName</th>
					<th style='border: 2px solid black'>Email</th>
					<th style='border: 2px solid black'>Role</th>
					<th style='border: 2px solid black'>Actions</th>
				</tr>
			</thead>

			<c:forEach var="user" items="${users}">
				<tr style='border: 2px solid black'>
					<td style='border: 2px solid black'>${user.id}</td>
					<td style='border: 2px solid black'>${user.loginName}</td>
					<td style='border: 2px solid black'>${user.email}</td>
					<td style='border: 2px solid black'>${user.role}</td>
					<td style='border: 2px solid black'><spring:url
							value="/users/${user.id}" var="userUrl" /> <spring:url
							value="/users/${user.id}/delete" var="deleteUrl" /> <spring:url
							value="/users/${user.id}/update" var="updateUrl" />

						<button onclick="location.href='${userUrl}'">Query</button>
						<button onclick="location.href='${updateUrl}'">Update</button>
						<button onclick="location.href='${deleteUrl}'">Delete</button>
					</td>
				</tr>
			</c:forEach>
		</table>

		<spring:url value="/users/add" var="urlAddUser" />
		<button class="btn btn-info" onclick="location.href='${urlAddUser}'">Add
			New User</button>

	</div>
</div>

<jsp:include page="../fragments/footer.jsp" />

</body>
</html>