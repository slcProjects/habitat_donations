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
							<th>Available Times</th>
							<th>Type</th>
							<th>Status</th>
							<th>Address</th>
						</tr>
					</thead>

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
							<td>${donation.address} ${donation.city},
								${donation.province}, ${donation.postalCode}</td>
						</tr>
					</c:forEach>
				</table>
				<br />
				<input type="submit" value="Print" onClick="window.print()" />
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>

