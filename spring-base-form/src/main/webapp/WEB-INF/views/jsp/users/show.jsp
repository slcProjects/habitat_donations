<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

			<h1>User Detail</h1>
			<br />

			<div class="row">
				<label class="col-sm-2">ID</label>
				<div class="col-sm-10">${user.id}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Login Name</label>
				<div class="col-sm-10">${user.loginName}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Full Name</label>
				<div class="col-sm-10">${user.firstName}${user.lastName}</div>
			</div>
			
			<div class="row">
				<label class="col-sm-2">Email</label>
				<div class="col-sm-10">${user.email}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Phone</label>
				<div class="col-sm-10">${user.phone}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Address</label>
				<div class="col-sm-10">${user.address} ${user.city},
					${user.province}, ${user.postalCode}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Role</label>
				<div class="col-sm-10">${user.role}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Notifications?</label>
				<div class="col-sm-10">${user.notify}</div>
			</div>

			<spring:url value="/users" var="userList" />
			<button class="btn btn-info" onclick="location.href='${userList}'">View
				all users</button>

		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>