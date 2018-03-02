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
								<th>Address</th>
							</tr>
						</thead>

						<c:forEach var="donation" items="${donations}">
							<tr>
								<td>${donation.id}</td>
								<td>${donation.description}</td>
								<td>${donation.time}</td>
								<td>${donation.address} ${donation.city},
									${donation.province}, ${donation.postalCode}</td>
							</tr>
						</c:forEach>
					</table>
					<input class="btn btn-info" type="submit" value="Print Schedule" onClick="window.print()"/>
					<spring:url value="/schedule/print/${month}/${day}/${year}" var="printUrl" />
					<button class="btn btn-info" onclick="location.href='${printUrl}'">Printer Friendly Version</button>
				</c:otherwise>
			</c:choose>
			
			<spring:url value="/calendar/${month}/${year}/recent" var="calendar" />
			<button class="btn btn-info" onclick="location.href='${calendar}'">View calendar</button>
			
			<spring:url value="/donations" var="donationList" />
			<button class="btn btn-info"
				onclick="location.href='${donationList}'">Received
				Donations</button>
			<spring:url value="/dashboard" var="dashboardUrl" />
			<button class="btn btn-info" onclick="location.href='${dashboardUrl}'">Staff Dashboard</button>

			<spring:url value="/logout" var="logoutUrl" />
			<button class="btn btn-info" onclick="location.href='${logoutUrl}'">Log Out</button>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

