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
			
			<c:choose>
				<c:when test="${donationForm['new']}">
					<h1>Donate</h1>
				</c:when>
				<c:otherwise>
					<h1>Update Donation</h1>
				</c:otherwise>
			</c:choose>
			<br />

			<div class="gf_browser_chrome gform_wrapper" id="gform_wrapper_6">
				<spring:url value="/donations" var="donationActionUrl" />

				<form:form class="form-horizontal" method="post"
					modelAttribute="donationForm" action="${donationActionUrl}"
					enctype="multipart/form-data">
					<form:hidden path="id" />
					<form:hidden path="donor" />
					<form:hidden path="numImages" />
					<form:hidden path="completedDate" />
					<div class="gform_heading">
						<span class="gform_description"></span>
					</div>
					<div class="gform_body">
						<ul id="gform_fields_6"
							class="gform_fields top_label form_sublabel_below description_below">

							<li id="field_6_0"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.descError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Item Description<span
									class="gfield_required">*</span></label> <span
								class="ginput_full address_line_1" id="input_6_2_5_container"><spring:bind
										path="description">
										<form:input path="description" id="description" />
										<form:errors class="gfield_description validation_message" path="description" />
										<div class="gf_clear gf_clear_complex"></div>
									</spring:bind> </span></li>

							<li id="field_6_02"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.valueError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Estimated Value<span
									class="gfield_required">*</span></label> <span
								class="ginput_left address_zip" id="input_6_2_5_container2"><spring:bind
										path="value">
										<form:input path="value" id="value" />
										<form:errors class="gfield_description validation_message" path="value" />
										<div class="gf_clear gf_clear_complex"></div>
									</spring:bind> </span></li>

							<li id="field_6_03"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.dateError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Scheduled Date (24 hour format:
									YYYY-MM-DD HH:MM:SS)<span class="gfield_required">*</span>
							</label> <span class="ginput_left address_zip"
								id="input_6_2_5_container3"><spring:bind
										path="scheduledDate">
										<form:input path="scheduledDate" id="scheduledDate" />
										<form:errors class="gfield_description validation_message" path="scheduledDate" />
										<div class="gf_clear gf_clear_complex"></div>
									</spring:bind> </span></li>

							<li id="field_6_2"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.typeError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_2_1">Donation Type<span
									class="gfield_required">*</span></label> <span
								class="ginput_left address_zip"><spring:bind path="type">
										<form:select path="type">
											<form:option value="NONE" label="" />
											<form:options items="${typeList}" />
										</form:select>
										<form:errors class="gfield_description validation_message" path="type" />
									</spring:bind></span></li>
								
							<li id="field_6_2"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.addrError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_2_1">Address<span class="gfield_required">*</span></label>
								<div
									class="ginput_complex ginput_container has_street has_street2 has_city has_state has_zip ginput_container_address gfield_trigger_change"
									id="input_6_2">
									<span class="ginput_full address_line_1"
										id="input_6_2_1_container"> <spring:bind path="address">
											<form:input class="textbox" path="address" id="address" />
											<label for="input_6_2_1" id="input_6_2_1_label">Street
												Address</label>
										</spring:bind>
									</span><span class="ginput_left address_city"
										id="input_6_2_3_container"> <spring:bind path="city">
											<form:input path="city" id="city" />
											<label for="input_6_2_3" id="input_6_2_3_label">City</label>
										</spring:bind>
									</span><span class="ginput_right address_state"
										id="input_6_2_4_container"> <spring:bind
											path="province">
											<form:select path="province">
												<form:option value="NONE" label="" />
												<form:options items="${provinceList}" />
											</form:select>
											<label for="input_6_2_4" id="input_6_2_4_label">Province</label>
										</spring:bind>
									</span><span class="ginput_left address_zip"
										id="input_6_2_5_container"><spring:bind
											path="postalCode">
											<form:input path="postalCode" id="postalCode" />
											<label for="input_6_2_5" id="input_6_2_5_label">Postal
												Code</label>
											<form:errors class="gfield_description validation_message" path="postalCode" />
										</spring:bind> </span>
									<div class="gf_clear gf_clear_complex"></div>
								</div>
								<form:errors class="gfield_description validation_message" path="address" /></li>

							<li id="field_6_04"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.dropError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Drop Fee</label> <span
								class="ginput_left address_zip" id="input_6_2_5_container4"><spring:bind
										path="dropFee">
										<form:input path="dropFee" id="dropFee" />
										<form:errors class="gfield_description validation_message" path="dropFee" />
									</spring:bind></span></li>

							<li id="field_6_05"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.receiverError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Receiver ID</label> <span
								class="ginput_left address_zip" id="input_6_2_5_container5"><spring:bind
										path="receiver">
										<form:input path="receiver" id="receiver" />
										<form:errors class="gfield_description validation_message" path="receiver" />
									</spring:bind></span></li>

							<c:choose>
								<c:when test="${role == 'Staff'}">
									<li id="field_6_6"
										class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.statusError}"><label
										class="gfield_label gfield_label_before_complex"
										for="input_6_1_3">Donation Status<span
											class="gfield_required">*</span></label> <span
										class="ginput_left address_zip"><spring:bind
												path="status">
												<form:select path="status">
													<form:option value="NONE" label="" />
													<form:options items="${statusList}" />
												</form:select>
												<form:errors class="gfield_description validation_message" path="status" />
											</spring:bind> </span></li>
								</c:when>
								<c:otherwise>
									<form:hidden path="status" />
								</c:otherwise>
							</c:choose>

							<li id="field_6_7"
								class="gfield gfield_price gfield_price_6_7 gfield_product_6_7 field_sublabel_below field_description_below gfield_visibility_visible"><label
								class="gfield_label" for="input_6_7">Would you like to
									receive a tax receipt for you donation? </label> <spring:bind
									path="receipts">
									<form:checkbox path="receipts" id="receipts" />
								</spring:bind></li>

						</ul>

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
											<spring:url value="/images/${imageIds}/delete"
												var="deleteUrl" />
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
										<label> <form:input type="file" path="file1"
												id="file1" class="form-control input-sm" />
										</label>
										<form:errors class="gfield_description validation_message" path="file1"/>
									</div>
								</div>
							</div>
						</spring:bind>

						<spring:bind path="file2">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Upload a file</label>
								<div class="col-sm-10">
									<div class="checkbox">
										<label> <form:input type="file" path="file2"
												id="file2" class="form-control input-sm" />
										</label>
										<form:errors class="gfield_description validation_message" path="file2"/>
									</div>
								</div>
							</div>
						</spring:bind>

						<spring:bind path="file3">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Upload a file</label>
								<div class="col-sm-10">
									<div class="checkbox">
										<label> <form:input type="file" path="file3"
												id="file3" class="form-control input-sm" />
										</label>
										<form:errors class="gfield_description validation_message" path="file3" />
									</div>
								</div>
							</div>
						</spring:bind>

						<spring:bind path="file4">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Upload a file</label>
								<div class="col-sm-10">
									<div class="checkbox">
										<label> <form:input type="file" path="file4"
												id="file4" class="form-control input-sm" />
										</label>
										<form:errors class="gfield_description validation_message" path="file4"/>
									</div>
								</div>
							</div>
						</spring:bind>

					</div>

					<div class="gform_footer top_label">
						<c:choose>
							<c:when test="${donationForm['new']}">
								<button type="submit">Submit Donation</button>
							</c:when>
							<c:otherwise>
								<button type="submit">Update</button>
							</c:otherwise>
						</c:choose>
					</div>

				</form:form>

			</div>

			<spring:url value="/donationsforuser" var="forUserUrl" />
			<button onclick="location.href='${forUserUrl}'">View Your
				Donations</button>

			<spring:url value="/dashboard" var="dashboardUrl" />

			<c:choose>
				<c:when test="${role == 'Staff'}">

					<spring:url value="/donations" var="donationList" />
					<button class="btn btn-info"
						onclick="location.href='${donationList}'">Received
						Donations</button>
					<button class="btn btn-info"
						onclick="location.href='${dashboardUrl}'">Staff Dashboard</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-info"
						onclick="location.href='${dashboardUrl}'">User Dashboard</button>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>