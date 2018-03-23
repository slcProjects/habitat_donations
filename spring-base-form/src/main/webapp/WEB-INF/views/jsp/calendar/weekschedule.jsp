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

			<h1>Donation Schedule</h1>

			<h3>${week}</h3>

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
								<th>Type</th>
								<th>Status</th>
								<th>Address</th>
								<th>Actions</th>
							</tr>
						</thead>

						<c:forEach var="donation" items="${donations}">
							<tr>
								<td>${donation.id}</td>
								<td>${donation.description}</td>
								<td>${donation.scheduledDate}</td>
								<td>${donation.type}</td>
								<td>
									<spring:url value="/statusupdate/${donation.id}/week/${day}/${month}/${year}" var="statusUrl" />
									<form:form class="form-horizontal" method="post"
										modelAttribute="statusForm${donation.id}" action="${statusUrl}">
										<spring:bind path="status">
											<form:select path="status" class="form-control">
												<form:option value="NONE" label="" />
												<form:options items="${statusList}" />
											</form:select>
										</spring:bind>
										<button type="submit">Update Status</button>
									</form:form>
								</td>
								<td>${donation.address} ${donation.city},
									${donation.province}, ${donation.postalCode}</td>
								<td><spring:url value="/donations/${donation.id}"
										var="donationUrl" />
									<button onclick="location.href='${donationUrl}'">Donation
										Detail</button></td>
							</tr>
						</c:forEach>
					</table>
					<form:errors path="statusChange" class="control-label" />
					<input type="submit" value="Print" onClick="window.print()"/>
				</c:otherwise>
			</c:choose>
			
			<spring:url value="/weekof/print/${day}/${month}/${year}" var="printUrl" />
			<button class="btn btn-info" onclick="window.open('${printUrl}')">Printer Friendly Version</button>

			<spring:url value="/calendar/${month}/${year}/recent" var="calendar" />
			<button class="btn btn-info" onclick="location.href='${calendar}'">View
				calendar</button>

			<spring:url value="/donations" var="donationList" />
			<button class="btn btn-info"
				onclick="location.href='${donationList}'">Received
				Donations</button>
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

