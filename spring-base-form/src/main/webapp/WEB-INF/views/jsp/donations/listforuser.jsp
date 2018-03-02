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

			<h1>All Donations for User</h1>
			<c:choose>
				<c:when test="${empty donations}">
					<p>No donations found</p>
				</c:when>
				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>#ID</th>
								<th>Description</th>
								<th>Scheduled Date</th>
								<th>Actions</th>
							</tr>
						</thead>

						<c:forEach var="donation" items="${donations}">
							<tr>
								<td>${donation.id}</td>
								<td>${donation.description}</td>
								<td>${donation.scheduledDate}</td>
								<td>
									<spring:url value="/donations/${donation.id}" var="donationUrl" />
									<button onclick="location.href='${donationUrl}'">Donation Detail</button> 
									<c:if test="${role == 'Staff'}">
										<spring:url value="/donations/${donation.id}/delete" var="deleteUrl" />
										<spring:url value="/donations/${donation.id}/update" var="updateUrl" />
										<button onclick="location.href='${updateUrl}'">Edit Donation</button>
										<button onclick="location.href='${deleteUrl}'">Delete</button>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>

			<spring:url value="/dashboard" var="dashboardUrl" />

			<c:choose>
				<c:when test="${role == 'Staff'}">
					<button class="btn btn-info"
						onclick="location.href='${dashboardUrl}'">Staff Dashboard</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-info"
						onclick="location.href='${dashboardUrl}'">User Dashboard</button>
				</c:otherwise>
			</c:choose>

			<spring:url value="/logout" var="logoutUrl" />
			<button class="btn btn-info" onclick="location.href='${logoutUrl}'">Log
				Out</button>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>