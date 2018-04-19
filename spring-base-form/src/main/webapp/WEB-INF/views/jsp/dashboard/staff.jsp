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

			<h1 style="text-transform: uppercase; text-align: center">Staff
				Dashboard</h1>
			<div class="container-staff-dashboard" style="text-align: center">
				<spring:url value="/donations/${userId}/add" var="donateUrl" />
				<button style="font-size: 20px" onclick="location.href='${donateUrl}'">
					<i class="material-icons">shopping_cart</i> Donate
				</button>
				<spring:url value="/donationsforuser" var="forUserUrl" />
				<button style="font-size: 20px" onclick="location.href='${forUserUrl}'">
					<i class="material-icons">description</i> View Your Donations
				</button>

				<spring:url value="/users/searchform" var="userSearch" />
				<button style="font-size: 20px" onclick="location.href='${userSearch}'">
					<i class="material-icons">search</i> User Search
				</button>

				<spring:url value="/users" var="users" />
				<button style="font-size: 20px" onclick="location.href='${users}'">
					<i class="material-icons">supervisor_account</i> View all users
				</button>

				<spring:url value="/donations" var="donations" />
				<button style="font-size: 20px" onclick="location.href='${donations}'">
					<i class="material-icons">list</i> View all donations
				</button>

				<spring:url value="/schedule/${month}/${day}/${year}" var="schedule" />
				<button style="font-size: 20px" onclick="location.href='${schedule}'">
					<i class="material-icons">today</i> View today's schedule
				</button>

				<spring:url value="/calendar/${month}/${year}/current"
					var="calendar" />
				<button style="font-size: 20px" onclick="location.href='${calendar}'">
					<i class="material-icons">date_range</i> View calendar
				</button>
				
				<spring:url value="/analytics" var="analyticsUrl" />
				<button style="font-size: 20px" onclick="location.href='${analyticsUrl}'">
					<i class="material-icons">lightbulb_outline</i> View Donation Analaytics
				</button>

				<spring:url value="/logout" var="logoutUrl" />
				<button style="font-size: 20px" onclick="location.href='${logoutUrl}'">
					<i class="material-icons">power_settings_new</i> Log Out
				</button>

			</div>
		</div>
	</div>
	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>