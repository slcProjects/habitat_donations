<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/header.jsp" />
<div class="content_body" style="margin-top: 156px">
	<div class="container">

		<c:choose>
			<c:when test="${donationForm['new']}">
				<h1>Donate</h1>
			</c:when>
			<c:otherwise>
				<h1>Update Donation</h1>
			</c:otherwise>
		</c:choose>
		<br />

		<spring:url value="/confirmation" var="donationActionUrl" />
		
		<form:form class="form-horizontal" method="post"
			modelAttribute="donationForm" action="${donationActionUrl}">
			
			<form:hidden path="id" />
			
			<form:hidden path="donor" />
			
			<%-- <spring:bind path="category">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Category</label>
					<div class="col-sm-10">
						<form:select path="category" class="form-control">
							<form:option value="NONE" label="--- Select ---" />
							<form:options items="${categoryList}" />
						</form:select>
						<form:errors path="category" class="control-label" />
					</div>
					<div class="col-sm-10"></div>
				</div>
			</spring:bind> --%>

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
						<form:input path="scheduledDate" class="form-control" id="scheduledDate"
							placeholder="2018-01-01" />
						<form:errors path="scheduledDate" class="control-label" />
					</div>
				</div>
			</spring:bind>

			<spring:bind path="address">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<form:input path="address" class="form-control"
							id="address" placeholder="123 abc street" />
						<form:errors path="address" class="control-label" />
					</div>
				</div>
			</spring:bind>
			
			<spring:bind path="city">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">City</label>
					<div class="col-sm-10">
						<form:input path="city" class="form-control"
							id="city" placeholder="Smart City" />
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
			
			<c:choose>
				<c:when test="${donationForm['new']}">
					<button type="submit">Submit Donation</button>
				</c:when>
				<c:otherwise>
					<button type="submit">Update</button>
				</c:otherwise>
			</c:choose>

		</form:form>
		<spring:url value="/donations" var="donationList" />
		<button class="btn btn-info" onclick="location.href='${donationList}'">Received Donations</button>
	</div>
</div>

<jsp:include page="../fragments/footer.jsp" />

</body>
</html>