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
					<table style='border: 2px solid black'>
						<thead>
							<tr style='border: 2px solid black'>
								<th style='border: 2px solid black'>#ID</th>
								<th style='border: 2px solid black'>Description</th>
								<th style='border: 2px solid black'>Scheduled Time</th>
								<th style='border: 2px solid black'>Address</th>
						<th style='border: 2px solid black'>Direction</th>
							</tr>
						</thead>

						<c:forEach var="donation" items="${donations}">
							<tr style='border: 2px solid black'>
								<td style='border: 2px solid black'>${donation.id}</td>
								<td style='border: 2px solid black'>${donation.description}</td>
								<td style='border: 2px solid black'>${donation.time}</td>
								<td style='border: 2px solid black'>${donation.address} ${donation.city},
									${donation.province}, ${donation.postalCode}</td>
								<td style='border: 2px solid black'> 
						<button onclick="location.href='http://www.google.ca/maps/place/'+'${donation.address},${donation.city},${donation.province},${donation.postalCode}'">Direction</button>
						</td>
							</tr>
						</c:forEach>
					</table>
					<input class="btn btn-info" type="submit" value="Print Schedule" onClick="window.print()"/>
					<spring:url value="/schedule/print" var="printUrl" />
					<button class="btn btn-info" onclick="location.href='${printUrl}'">Printer Friendly Version</button>
				</c:otherwise>
			</c:choose>
			
			<spring:url value="/calendar" var="calendar" />
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

