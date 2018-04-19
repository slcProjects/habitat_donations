<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/formhead.jsp" />
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
					<table id="scheduletable">
						<thead>
							<tr>
								<th>#ID</th>
								<th>Description</th>
								<th>Available Times</th>
								<th>Type</th>
								<th>Status</th>
								<th>Address</th>
								<th>Direction</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="donation" items="${donations}">
								<tr>
									<td>${donation.id}</td>
									<td>${donation.description}</td>
									<td>
										<c:forEach var="meridian" items="${donation.meridian}">
											${meridian}
										</c:forEach>
										<br />
									</td>
									<td>${donation.type}</td>
									<td>
										<div class="gf_browser_chrome gform_wrapper"
											id="gform_wrapper_6">
											<spring:url value="/statusupdate" var="statusUrl" />
											<c:choose>
												<c:when test="${not empty error && error == donation.id}">
													<c:set var="errClass" value="gfield_error" />
												</c:when>
												<c:otherwise>
													<c:set var="errClass" value="" />
												</c:otherwise>
											</c:choose>
											<ul id="gform_fields_6"
												class="gform_fields top_label form_sublabel_below description_below">
												<li
													class="gform_body gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${errClass}">
													<form:form class="form-horizontal" method="post"
														modelAttribute="statusForm${donation.id}"
														action="${statusUrl}">
														<form:hidden path="id" />
														<form:hidden path="day" />
														<form:hidden path="month" />
														<form:hidden path="year" />
														<form:hidden path="type" />
														<c:choose>
															<c:when test="${donation.status == 'AWAITING APPROVAL'}">
																AWAITING APPROVAL
															</c:when>
															<c:otherwise>
																<spring:bind path="status">
																	<form:select path="status" class="form-control">
																		<form:option value="NONE" label="" />
																		<form:options items="${statusList}" />
																	</form:select>
																</spring:bind>
																<button type="submit">Update Status</button>
																<c:if test="${not empty error && error == donation.id}">
																	<label class="gfield_description validation_message">This
																		field is required.</label>
																</c:if>
															</c:otherwise>
														</c:choose>
													</form:form>
												</li>
											</ul>
										</div>
									</td>
									<td>${donation.address} ${donation.city},
										${donation.province}, ${donation.postalCode}</td>
									<td><spring:url
											value="http://www.google.ca/maps/place/${donation.address},${donation.city},${donation.province},${donation.postalCode}"
											var="mapUrl" />
										<button onclick="window.open('${mapUrl}')">Direction</button></td>
								</tr>
							</c:forEach>
						</tbody>
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

<script type="text/javascript">
	$(document).ready( function () {
    	$('#scheduletable').DataTable();
	} );
</script>

</html>

