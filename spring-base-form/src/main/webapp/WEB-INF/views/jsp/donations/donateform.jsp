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

			<c:choose>
				<c:when test="${donationForm['new']}">
					<h1>Donate</h1>
				</c:when>
				<c:otherwise>
					<h1>Update Donation</h1>
				</c:otherwise>
			</c:choose>
			<br />

			<spring:url value="/donations" var="donationActionUrl" />

			<form:form class="form-horizontal" method="post"
				modelAttribute="donationForm" action="${donationActionUrl}"
				enctype="multipart/form-data">

				<form:hidden path="id" />

				<form:hidden path="donor" />

				<form:hidden path="numImages" />

				<spring:bind path="description">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Item Description</label>
						<div class="col-sm-10">
							<form:input path="description" type="text" class="form-control "
								id="description" placeholder="Description" />
							<form:errors path="description" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="value">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Estimated Value</label>
						<div class="col-sm-10">
							<form:input path="value" class="form-control" id="value"
								placeholder="123" />
							<form:errors path="value" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="scheduledDate">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Scheduled Date</label>
						<div class="col-sm-10">
							<form:input path="scheduledDate" class="form-control"
								id="scheduledDate" placeholder="2018-01-01" />
							<form:errors path="scheduledDate" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="address">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Address</label>
						<div class="col-sm-10">
							<form:input path="address" class="form-control" id="address"
								placeholder="123 abc street" />
							<form:errors path="address" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="city">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">City</label>
						<div class="col-sm-10">
							<form:input path="city" class="form-control" id="city"
								placeholder="Smart City" />
							<form:errors path="city" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="province">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Province</label>
						<div class="col-sm-5">
							<form:select path="province" class="form-control">
								<form:option value="NONE" label="--- Select ---" />
								<form:options items="${provinceList}" />
							</form:select>
							<form:errors path="province" class="control-label" />
						</div>
						<div class="col-sm-5"></div>
					</div>
				</spring:bind>

				<spring:bind path="postalCode">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Postal Code</label>
						<div class="col-sm-10">
							<form:input path="postalCode" class="form-control"
								id="postalCode" placeholder="A1A1A1" />
							<form:errors path="postalCode" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="dropFee">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Drop Fee</label>
						<div class="col-sm-10">
							<form:input path="dropFee" class="form-control" id="dropFee"
								placeholder="123.45" />
							<form:errors path="dropFee" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="receiver">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Receiver ID</label>
						<div class="col-sm-10">
							<form:input path="receiver" class="form-control" id="receiver"
								placeholder="1" />
							<form:errors path="receiver" class="control-label" />
						</div>
					</div>
				</spring:bind>

				<spring:bind path="receipts">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Send Tax Receipts?</label>
						<div class="col-sm-10">
							<div class="checkbox">
								<label> <form:checkbox path="receipts" id="receipts" />
								</label>
								<form:errors path="receipts" class="control-label" />
							</div>
						</div>
					</div>
				</spring:bind>

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
									<spring:url value="/images/${imageIds}/delete" var="deleteUrl" />
									<button formaction="${deleteUrl}">Delete Image</button>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<spring:bind path="file1">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Upload a file</label>
						<div class="col-sm-10">
							<div class="checkbox">
								<label> <form:input type="file" path="file1" id="file1"
										class="form-control input-sm" />
								</label>
								<form:errors path="file1" class="control-label" />
							</div>
						</div>
					</div>
				</spring:bind>

				<spring:bind path="file2">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Upload a file</label>
						<div class="col-sm-10">
							<div class="checkbox">
								<label> <form:input type="file" path="file2" id="file2"
										class="form-control input-sm" />
								</label>
								<form:errors path="file2" class="control-label" />
							</div>
						</div>
					</div>
				</spring:bind>

				<spring:bind path="file3">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Upload a file</label>
						<div class="col-sm-10">
							<div class="checkbox">
								<label> <form:input type="file" path="file3" id="file3"
										class="form-control input-sm" />
								</label>
								<form:errors path="file3" class="control-label" />
							</div>
						</div>
					</div>
				</spring:bind>

				<spring:bind path="file4">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<label class="col-sm-2 control-label">Upload a file</label>
						<div class="col-sm-10">
							<div class="checkbox">
								<label> <form:input type="file" path="file4" id="file4"
										class="form-control input-sm" />
								</label>
								<form:errors path="file4" class="control-label" />
							</div>
						</div>
					</div>
				</spring:bind>

				<c:choose>
					<c:when test="${donationForm['new']}">
						<button type="submit">Submit Donation</button>
					</c:when>
					<c:otherwise>
						<button type="submit">Update</button>
					</c:otherwise>
				</c:choose>

			</form:form>
			
			<c:choose>
				<c:when test="${role == 'Staff'}">
					<spring:url value="/donations" var="donationList" />
					<button class="btn btn-info"
						onclick="location.href='${donationList}'">Received
						Donations</button>
				</c:when>
			</c:choose>
			
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>