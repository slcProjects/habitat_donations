<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/header.jsp" />
<div class="content_body" style="margin-top: 156px">
	<div class="container">

		<c:choose>
			<c:when test="${userForm['new']}">
				<h1>Register User</h1>
			</c:when>
			<c:otherwise>
				<h1>Update User</h1>
			</c:otherwise>
		</c:choose>
		<br />

		<spring:url value="/users" var="userActionUrl" />

		<form:form class="form-horizontal" method="post"
			modelAttribute="userForm" action="${userActionUrl}">

			<form:hidden path="id" />

			<spring:bind path="loginName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Login Name</label>
					<div class="col-sm-10">
						<form:input path="loginName" type="text" class="form-control "
							id="loginName" placeholder="LoginName" />
						<form:errors path="loginName" class="control-label" />
					</div>
				</div>
			</spring:bind>

			<spring:bind path="password">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<form:password path="password" class="form-control" id="password"
							placeholder="password" />
						<form:errors path="password" class="control-label" />
					</div>
				</div>
			</spring:bind>

			<spring:bind path="confirmPassword">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Confirm Password</label>
					<div class="col-sm-10">
						<form:password path="confirmPassword" class="form-control"
							id="password" placeholder="password" />
						<form:errors path="confirmPassword" class="control-label" />
					</div>
				</div>
			</spring:bind>

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

			<spring:bind path="gender">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Gender</label>
					<div class="col-sm-10">
						<label class="radio-inline"> <form:radiobutton
								path="gender" value="M" /> Male
						</label> <label class="radio-inline"> <form:radiobutton
								path="gender" value="F" /> Female
						</label> <br />
						<form:errors path="gender" class="control-label" />
					</div>
				</div>
			</spring:bind>

			<spring:bind path="email">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<form:input path="email" class="form-control" id="email"
							placeholder="Email" />
						<form:errors path="email" class="control-label" />
					</div>
				</div>
			</spring:bind>

			<spring:bind path="phone">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Phone</label>
					<div class="col-sm-10">
						<form:input path="phone" class="form-control" id="phone"
							placeholder="012-345-6789" />
						<form:errors path="phone" class="control-label" />
					</div>
				</div>
			</spring:bind>

			<spring:bind path="address">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<form:input path="address" class="form-control" id="address"
							placeholder="Address" />
						<form:errors path="address" class="control-label" />
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

			<spring:bind path="province">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Province</label>
					<div class="col-sm-5">
						<form:select path="province" class="form-control">
							<form:option value="NONE" label="--- Select ---" />
							<form:options items="${provinceList}" />
						</form:select>
						<form:errors path="province" class="control-label" />
					</div>
					<div class="col-sm-5"></div>
				</div>
			</spring:bind>

			<spring:bind path="postalCode">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Postal Code</label>
					<div class="col-sm-10">
						<form:input path="postalCode" class="form-control" id="postalCode"
							placeholder="A1A1A1" />
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

			<spring:bind path="notify">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Would you like to receive ReStore Notifications?</label>
					<div class="col-sm-10">
						<div class="checkbox">
							<label> <form:checkbox path="notify" id="notify" />
							</label>
							<form:errors path="notify" class="control-label" />
						</div>
					</div>
				</div>
			</spring:bind>

			<!-- Custom Script, Spring map to model via 'name' attribute
		<div class="form-group">
			<label class="col-sm-2 control-label">Number</label>
			<div class="col-sm-10">

				<c:forEach items="${numberList}" var="obj">
					<div class="radio">
						<label> 
							<input type="radio" name="number" value="${obj}">${obj}
						</label>
					</div>
				</c:forEach>
			</div>
		</div>
 		-->

			<c:choose>
				<c:when test="${userForm['new']}">
					<button type="submit">Add</button>
				</c:when>
				<c:otherwise>
					<button type="submit">Update</button>
				</c:otherwise>
			</c:choose>

		</form:form>
		<spring:url value="/users" var="userList" />
		<button class="btn btn-info" onclick="location.href='${userList}'">Users</button>
	</div>
</div>

<jsp:include page="../fragments/footer.jsp" />

</body>
</html>