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

			<h1>Log In Page</h1>

			<spring:url value="/login" var="login" />
			
			<form:form class="form-horizontal" method="post"
			modelAttribute="loginForm" action="${login}">

				<spring:bind path="username">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Username</label>
						<div class="col-sm-10">
							<form:input path="username" type="text" class="form-control "
								id="username"/>
							<form:errors path="username" class="control-label" />
						</div>
					</div>
				</spring:bind>
				
				<spring:bind path="password">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<form:password path="password" class="form-control "
								id="password"/>
							<form:errors path="password" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<button type="submit">Log In</button>

			</form:form>
			
			<p>New donor? Register today!</p>
			<spring:url value="/users/register" var="registerUrl" />
			<button class="btn btn-info" onclick="location.href='${registerUrl}'">Register</button>
			

		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>