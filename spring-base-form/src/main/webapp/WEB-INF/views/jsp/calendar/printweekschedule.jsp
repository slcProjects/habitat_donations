<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/head.jsp" />
<body>
	<div style="margin-left: 20px">

		<h4>Donation Schedule: ${week}</h4>

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
							<th>Address</th>
						</tr>
					</thead>

					<c:forEach var="donation" items="${donations}">
						<tr>
							<td>${donation.id}</td>
							<td>${donation.description}</td>
							<td>${donation.scheduledDate}</td>
							<td>${donation.address} ${donation.city},
								${donation.province}, ${donation.postalCode}</td>
						</tr>
					</c:forEach>
				</table>
				<input type="submit" value="Print" onClick="window.print()" />
			</c:otherwise>
		</c:choose>

		<spring:url value="/calendar/weekof/${day}/${month}/${year}"
			var="weekschedule" />
		<button onclick="location.href='${weekschedule}'">Back</button>
	</div>
</body>
</html>

