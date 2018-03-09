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

			<h3>${date}</h3>
			
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
								<th>Scheduled Time</th>
								<th>Type</th>
								<th>Status</th>
								<th>Address</th>
								<th>Direction</th>
							</tr>
						</thead>

						<c:forEach var="donation" items="${donations}">
							<tr>
								<td>${donation.id}</td>
								<td>${donation.description}</td>
								<td>${donation.time}</td>
								<td>${donation.type}</td>
								<td>
									<spring:url value="/statusupdate/${donation.id}" var="statusUrl" />
									<form:form class="form-horizontal" method="post"
										modelAttribute="statusForm${donation.id}" action="${statusUrl}">
										<spring:bind path="status">
											<form:select path="status" class="form-control">
												<%-- <form:option value="NONE" label="--- Select ---" /> --%>
												<form:options items="${statusList}" />
											</form:select>
											<form:errors path="status" class="control-label" />
										</spring:bind>
										<button type="submit">Update Status</button>
									</form:form>
								</td>
								<td>${donation.address} ${donation.city},
									${donation.province}, ${donation.postalCode}</td>
								<td style='border: 2px solid black'>
									<spring:url value="http://www.google.ca/maps/place/${donation.address},${donation.city},${donation.province},${donation.postalCode}"
										var="mapUrl" />
									<button
										onclick="window.open('${mapUrl}')">Direction</button>
								</td>
							</tr>
						</c:forEach>
					</table>
					<input class="btn btn-info" type="submit" value="Print Schedule"
						onClick="window.print()" />
					<spring:url value="/schedule/print/${month}/${day}/${year}"
						var="printUrl" />
					<button class="btn btn-info" onclick="window.open('${printUrl}')">Printer
						Friendly Version</button>
				</c:otherwise>
			</c:choose>

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

