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
		<div>
		
			<h4>Donation Schedule: ${date}</h4>
			
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
							</tr>
						</thead>

						<c:forEach var="donation" items="${donations}">
							<tr style='border: 2px solid black'>
								<td style='border: 2px solid black'>${donation.id}</td>
								<td style='border: 2px solid black'>${donation.description}</td>
								<td style='border: 2px solid black'>${donation.time}</td>
								<td style='border: 2px solid black'>${donation.address} ${donation.city},
									${donation.province}, ${donation.postalCode}</td>
							</tr>
						</c:forEach>
					</table>
					<input type="submit" value="Print" onClick="window.print()"/>
				</c:otherwise>
			</c:choose>
			<spring:url value="/schedule" var="schedule" />
			<button onclick="location.href='${schedule}'">Back</button>
		</div>
	</div>
</body>
</html>

