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
					<table id="dontable">
						<thead>
							<tr>
								<th>#ID</th>
								<th>Description</th>
								<th>Available Dates</th>
								<th>Type</th>
								<th>Status</th>
								<th>Actions</th>
								<th>Direction</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="donation" items="${donations}">
								<tr>
									<td>${donation.id}</td>
									<td>${donation.description}</td>
									<td>
										<c:forEach var="date" items="${donation.scheduledDate}" varStatus="dateindex">
											${date}:
											<c:forEach var="meridian" items="${donation.meridian}" varStatus="meridianindex">
												<c:if test="${dateindex.count == meridianindex.count}">
													${meridian}
												</c:if>
											</c:forEach>
											<br />
										</c:forEach>
									</td>
									<td>${donation.type}</td>
									<td>${donation.status}</td>
									<td><spring:url value="/donations/${donation.id}"
											var="donationUrl" /> <spring:url
											value="/donations/${donation.id}/approve" var="approveUrl" /> <spring:url
											value="/donations/${donation.id}/decline" var="declineUrl" /> <spring:url
											value="/donations/${donation.id}/delete" var="deleteUrl" /> <spring:url
											value="/donations/${donation.id}/update" var="updateUrl" />

										<button onclick="location.href='${donationUrl}'">Donation
											Detail</button>
										<button onclick="location.href='${updateUrl}'">Edit
											Donation</button>
										<c:choose>
											<c:when test="${donation.status == 'AWAITING APPROVAL'}">
												<button onclick="location.href='${approveUrl}'">Approve Donation</button>
												<button onclick="location.href='${declineUrl}'">Decline Donation</button>
											</c:when>
											<c:otherwise>
												<button onclick="location.href='${deleteUrl}'">Delete Donation</button>
											</c:otherwise>
										</c:choose></td>
									<td style='border: 2px solid black'>
										<spring:url value="http://www.google.ca/maps/place/${donation.address},${donation.city},${donation.province},${donation.postalCode}"
											var="mapUrl" />
										<button
											onclick="window.open('${mapUrl}')">view
											on google map</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
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

<script type="text/javascript">
	$(document).ready( function () {
    	$('#dontable').DataTable();
	} );
</script>

</html>