<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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

			<h1 style="text-align: center">Donation Analytics</h1>
				
			<div class="container-staff-dashboard" style="text-align: center">
			
				<spring:url value="/analytics/type" var="typeUrl" />
				<button style="font-size: 20px" onclick="location.href='${typeUrl}'">
					<i class="material-icons">merge_type</i> View Donation Types
				</button>

				<spring:url value="/analytics/code" var="codeUrl" />
				<button style="font-size: 20px" onclick="location.href='${codeUrl}'">
					<i class="material-icons">location_on</i> View Postal Codes
				</button>

				<spring:url value="/analytics/meridian" var="meridianUrl" />
				<button style="font-size: 20px" onclick="location.href='${meridianUrl}'">
					<i class="material-icons">brightness_high</i> View Donation Times
				</button>

				<spring:url value="/dashboard" var="dashboardUrl" />
				<button style="font-size: 20px" onclick="location.href='${dashboardUrl}'">
					<i class="material-icons">build</i> Staff Dashboard
				</button>

			</div>
		</div>
	</div>
	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>