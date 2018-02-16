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

			<div class="row">
				<label class="col-sm-2">ID</label>
				<div class="col-sm-10">${donation.id}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Donor ID</label>
				<div class="col-sm-10">${donation.donor}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Item Description</label>
				<div class="col-sm-10">${donation.description}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Scheduled Date</label>
				<div class="col-sm-10">${donation.scheduledDate}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Completed Date</label>
				<div class="col-sm-10">
					<c:choose>
						<c:when test="${donation.completedDate == null}">
							Incomplete
						</c:when>
						<c:otherwise>
							${donation.completedDate}
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Address</label>
				<div class="col-sm-10">${donation.address}${donation.city},
					${donation.province}, ${donation.postalCode}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Drop Fee</label>
				<div class="col-sm-10">
					<c:choose>
						<c:when test="${donation.dropFee == 0}">
						No Drop Fee
					</c:when>
						<c:otherwise>
						${donation.dropFee}
					</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Receiver ID</label>
				<div class="col-sm-10">
					<c:choose>
						<c:when test="${donation.receiver == 0}">
						No Receiver
					</c:when>
						<c:otherwise>
						${donation.receiver}
					</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Tacking</label>
				<div class="col-sm-10">
					<c:choose>
						<c:when test="${donation.tacking == null}">
						N/A
					</c:when>
						<c:otherwise>
						${donation.tacking}
					</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Would you like to have Tax Receipts?</label>
				<div class="col-sm-10">${donation.receipts}</div>
			</div>

			<div class="row">
				<label class="col-sm-2">Item Images</label>
				<div class="col-sm-10">
					<c:choose>
						<c:when test="${noImage == true}">
							No images
						</c:when>
						<c:otherwise>
							<c:forEach var="imageIds" items="${imageIds}">
								<spring:url value="/images/${imageIds}" var="imageUrl" />
								<img src="${imageUrl}" />
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<spring:url value="/donations" var="donationList" />
			<button class="btn btn-info"
				onclick="location.href='${donationList}'">View Received
				Donations</button>

		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>