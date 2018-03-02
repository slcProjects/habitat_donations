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

			<h1>All Donations</h1>
			<c:choose>
				<c:when test="${empty donations}">
					<p>No donations found</p>
				</c:when>
				<c:otherwise>
					<table style='border: 2px solid black'>
						<thead>
							<tr style='border: 2px solid black'>
								<th style='border: 2px solid black'>#ID</th>
								<th style='border: 2px solid black'>Description</th>
								<th style='border: 2px solid black'>Scheduled Date</th>
								<th style='border: 2px solid black'>Actions</th>
								<th style='border: 2px solid black'> Direction</th>
								
							</tr>
						</thead>

						<c:forEach var="donation" items="${donations}">
							<tr style='border: 2px solid black'>
								<td style='border: 2px solid black'>${donation.id}</td>
								<td style='border: 2px solid black'>${donation.description}</td>
								<td style='border: 2px solid black'>${donation.scheduledDate}</td>
								<td style='border: 2px solid black'><spring:url
										value="/donations/${donation.id}" var="donationUrl" /> <spring:url
										value="/donations/${donation.id}/delete" var="deleteUrl" /> <spring:url
										value="/donations/${donation.id}/update" var="updateUrl" />

									<button onclick="location.href='${donationUrl}'">Donation
										Detail</button>
									<button onclick="location.href='${updateUrl}'">Edit
										Donation</button>
									<button onclick="location.href='${deleteUrl}'">Delete</button></td>
									<td style='border: 2px solid black'> 
						<button onclick="location.href='http://www.google.ca/maps/place/'+'${donation.address},${donation.city},${donation.province},${donation.postalCode}'">view on google map</button>
						</td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>

			<spring:url value="/users" var="urlUser" />
			<button class="btn btn-info" onclick="location.href='${urlUser}'">View
				all Users</button>
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