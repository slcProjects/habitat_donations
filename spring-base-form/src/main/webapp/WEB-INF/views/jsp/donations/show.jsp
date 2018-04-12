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

			<c:if test="${not empty msg}">
				<div class="alert alert-${css} alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>${msg}</strong>
				</div>
			</c:if>

			<h1>Donation Detail</h1>
			<br />

			<div class="gf_browser_chrome gform_wrapper" id="gform_wrapper_6">
				<div class="gform_heading">
					<span class="gform_description"></span>
				</div>
				<div class="gform_body">
					<ul
						class="gform_fields top_label form_sublabel_below description_below">

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">ID</label>
							<div>${donation.id}</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Donor ID</label>
							<div>${donation.donor}</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Item
								Description</label>
							<div>${donation.description}</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Item Value</label>
							<div>${donation.value}</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Available Dates</label>
							<div>
								<c:forEach var="date" items="${donation.scheduledDate}" varStatus="dateindex">
									<spring:url value="/donation/${donation.id}/choosedate/${dateindex.index}" var="chooseUrl" />
									<form:form class="form-horizontal" method="post" action="${chooseUrl}">
										${date}:
										<c:forEach var="meridian" items="${donation.meridian}" varStatus="meridianindex">
											<c:if test="${dateindex.count == meridianindex.count}">
												${meridian}
											</c:if>
										</c:forEach>
										<c:if test="${role == 'Staff' && dateCount > 1}">
											<button type="submit">Select Date</button>
										</c:if>
									</form:form>
								</c:forEach>
							</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Completed Date</label>
							<div>
								<c:choose>
									<c:when test="${donation.completedDate == null}">
										<p>Incomplete</p>
									</c:when>
									<c:otherwise>
										${donation.completedDate}
									</c:otherwise>
								</c:choose>
							</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Type</label>
							<div>${donation.type}</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Address</label>
							<div>${donation.address} ${donation.city},
								${donation.province}, ${donation.postalCode}</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Drop Fee</label>
							<div>
								<c:choose>
									<c:when test="${donation.dropFee == 0}">
										<p>No Drop Fee</p>
									</c:when>
									<c:otherwise>
										${donation.dropFee}
									</c:otherwise>
								</c:choose>
							</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Receiver ID</label>
							<div>
								<c:choose>
									<c:when test="${donation.receiver == 0}">
										<p>No Receiver</p>
									</c:when>
									<c:otherwise>
										${donation.receiver}
									</c:otherwise>
								</c:choose>
							</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Status</label>
							<div>${donation.status}</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Tacking</label>
							<div>
								<c:choose>
									<c:when test="${donation.tacking == null}">
										<p>N/A</p>
									</c:when>
									<c:otherwise>
										${donation.tacking}
									</c:otherwise>
								</c:choose>
							</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Receives Tax Receipt</label>
							<div>
								<c:choose>
									<c:when test="${donation.receipts}">
										<p>Yes</p>
									</c:when>
									<c:otherwise>
										<p>No</p>
									</c:otherwise>
								</c:choose>
							</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible">
							<label class="gfield_label">Item Images</label>
							<div>
								<c:choose>
									<c:when test="${noImage == true}">
										<p>No images</p>
									</c:when>
									<c:otherwise>
										<c:set var="imagediv" value="${1}" />
										<c:forEach var="imageIds" items="${imageIds}">
											<div class="imagediv${imagediv}">
												<spring:url value="/images/${imageIds}" var="imageUrl" />
												<img src="${imageUrl}" />
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</li>

					</ul>

				</div>

				<div style="float: left">
					<spring:url value="/donationsforuser" var="forUserUrl" />
					<button onclick="location.href='${forUserUrl}'">View Your
						Donations</button>

					<spring:url value="/dashboard" var="dashboardUrl" />

					<c:choose>
						<c:when test="${role == 'Staff'}">
							<spring:url value="/donations/${donation.id}/update"
								var="updateUrl" />
							<button onclick="location.href='${updateUrl}'">Update
								Details</button>
							<spring:url value="/donations" var="donationList" />
							<button class="btn btn-info"
								onclick="location.href='${donationList}'">View all
								donations</button>
							<spring:url value="/calendar/${month}/${year}/recent"
								var="donationList" />
							<button class="btn btn-info"
								onclick="location.href='${donationList}'">View calendar
								of donation month</button>
							<button class="btn btn-info"
								onclick="location.href='${dashboardUrl}'">Staff
								Dashboard</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-info"
								onclick="location.href='${dashboardUrl}'">User
								Dashboard</button>
						</c:otherwise>
					</c:choose>

					<spring:url value="/logout" var="logoutUrl" />
					<button class="btn btn-info" onclick="location.href='${logoutUrl}'">Log
						Out</button>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>