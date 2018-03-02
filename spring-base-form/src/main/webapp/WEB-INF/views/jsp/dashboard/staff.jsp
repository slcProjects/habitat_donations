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

			<h1>Staff Dashboard</h1>
			
			<spring:url value="/donations/${userId}/add" var="donateUrl" />
			<button onclick="location.href='${donateUrl}'">Donate</button>
			
			<spring:url value="/donationsforuser" var="forUserUrl" />
			<button onclick="location.href='${forUserUrl}'">View Your Donations</button>

			<spring:url value="/users" var="users" />
			<button class="btn btn-info" onclick="location.href='${users}'">View all users</button>
				
			<spring:url value="/donations" var="donations" />
			<button class="btn btn-info" onclick="location.href='${donations}'">View all donations</button>
				
			<spring:url value="/schedule/${month}/${day}/${year}" var="schedule" />
			<button class="btn btn-info" onclick="location.href='${schedule}'">View today's schedule</button>
			
			<spring:url value="/calendar/${month}/${year}/current" var="calendar" />
			<button class="btn btn-info" onclick="location.href='${calendar}'">View calendar</button>
			
			<!--<button class="btn btn-info">Print today's schedule</button>-->
				
			<spring:url value="/logout" var="logoutUrl" />
			<button class="btn btn-info" onclick="location.href='${logoutUrl}'">Log Out</button>

		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>