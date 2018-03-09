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

			<h1>User Search Form</h1>
			<br />

			<spring:url value="/users/searchresult" var="userActionUrl" />

			<form:form class="form-horizontal" method="post"
				modelAttribute="searchForm" action="${userActionUrl}">

				<spring:bind path="firstName">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">First Name</label>
						<div class="col-sm-10">
							<form:input path="firstName" class="form-control" id="firstName"
								placeholder="FirstName" />
							<form:errors path="firstName" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="lastName">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Last Name</label>
						<div class="col-sm-10">
							<form:input path="lastName" class="form-control" id="lastName"
								placeholder="LastName" />
							<form:errors path="lastName" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="city">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">City</label>
						<div class="col-sm-10">
							<form:input path="city" class="form-control" id="city"
								placeholder="City" />
							<form:errors path="city" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="postalCode">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Postal Code</label>
						<div class="col-sm-10">
							<form:input path="postalCode" class="form-control"
								id="postalCode" placeholder="A1A1A1" />
							<form:errors path="postalCode" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="role">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Role</label>
						<div class="col-sm-10">
							<form:input path="role" class="form-control" id="role"
								placeholder="Donor" />
							<form:errors path="role" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<button type="submit">Search</button>

			</form:form>
			
			<spring:url value="/dashboard" var="dashboardUrl" />
			<spring:url value="/users" var="donationList" />
			<button class="btn btn-info" onclick="location.href='${donationList}'">View All Users</button>
			<button class="btn btn-info" onclick="location.href='${dashboardUrl}'">Staff Dashboard</button>
			
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>