<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/header.jsp" />
<head>
<title>Donate Here</title>
<h1>What you Donating Today..?</h1>
</head>
<body>
<%-- 				<spring:bind path="category">
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
			</spring:bind>
			
			<spring:bind path="estimateValue">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Estimate Value</label>
					<div class="col-sm-10">
						<form:input path="estimateValue" class="form-control" id="estimateValue"
							placeholder="99.99" />
						<form:errors path="estimateValue" class="control-label" />
					</div>
				</div>
			</spring:bind>
			
			<spring:bind path="conditionDescription">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Condition Description</label>
					<div class="col-sm-10">
						<form:input path="conditionDescription" class="form-control" id="conditionDescription"
							placeholder="month old" />
						<form:errors path="conditionDescription" class="control-label" />
					</div>
				</div>
			</spring:bind>
			
			<spring:bind path="taxReceipt">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Tax Receipt?</label>
					<div class="col-sm-10">
						<div class="checkbox">
							<label> <form:checkbox path="taxReceipt" id="taxReceipt" />
							</label>
							<form:errors path="taxReceipt" class="control-label" />
						</div>
					</div>
				</div>
			</spring:bind>
			
			<spring:bind path="pickupTime">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Pickup Time</label>
					<div class="col-sm-10">
						<form:input path="pickupTime" class="form-control" id="pickupTime"
							placeholder="12:00" />
						<form:errors path="pickupTime" class="control-label" />
					</div>
				</div>
			</spring:bind>
			
			<spring:bind path="donationNewAddress">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<form:input path="donationNewAddress" class="form-control" id="donationNewAddress"
							placeholder="123 abc street" />
						<form:errors path="donationNewAddress" class="control-label" />
					</div>
				</div>
			</spring:bind>
			
			<spring:bind path="donationNewProvince">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Province</label>
					<div class="col-sm-5">
						<form:select path="donationNewProvince" class="form-control">
							<form:option value="NONE" label="--- Select ---" />
							<form:options items="${provinceList}" />
						</form:select>
						<form:errors path="donationNewProvince" class="control-label" />
					</div>
					<div class="col-sm-5"></div>
				</div>
			</spring:bind>
			
			<spring:bind path="donationNewCity">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">City</label>
					<div class="col-sm-10">
						<form:input path="donationNewCity" class="form-control" id="donationNewCity"
							placeholder="Smart City" />
						<form:errors path="donationNewCity" class="control-label" />
					</div>
				</div>
			</spring:bind>
			
			<spring:bind path="donationNewPostalcode">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">City</label>
					<div class="col-sm-10">
						<form:input path="donationNewPostalcode" class="form-control" id="donationNewPostalcode"
							placeholder="A1A1A1" />
						<form:errors path="donationNewPostalcode" class="control-label" />
					</div>
				</div>
			</spring:bind> --%>

</body>

<jsp:include page="../fragments/footer.jsp" />
</html>