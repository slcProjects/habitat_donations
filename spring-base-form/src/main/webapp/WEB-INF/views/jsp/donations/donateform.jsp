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
					<c:if test="${role == 'Donor'}">
						<p>Donations cannot be edited once submitted. Please contact
							the Habitat ReStore if you require any changes.</p>
					</c:if>
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
										<form:errors class="gfield_description validation_message"
											path="description" />
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
										<form:errors class="gfield_description validation_message"
											path="value" />
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
										<form:errors class="gfield_description validation_message"
											path="scheduledDate" />
										<div class="gf_clear gf_clear_complex"></div>
									</spring:bind> </span> <br /> <c:set var="ctr" value="${1}" />

								<table>
									<thead>
										<tr>
											<th>Sun</th>
											<th>Mon</th>
											<th>Tue</th>
											<th>Wed</th>
											<th>Thu</th>
											<th>Fri</th>
											<th>Sat</th>
										</tr>
									</thead>
									<c:forEach begin="1" end="${weeksInMonth}" step="1" var="week">
										<tr id="week${week}">
											<c:forEach begin="1" end="7" step="1" var="dayInWeek">
												<c:choose>
													<c:when
														test="${ctr > daysInMonth || week == 1 && first > dayInWeek && dayInWeek != 0}">
														<td class='calendar-day-np-form'></td>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${ctr < day}">
																<td id="day${ctr}" class='calendar-day-np-form'>${ctr}</td>
															</c:when>
															<c:when test="${ctr == day}">
																<td id="day${ctr}" class='calendar-day-form today'><div>${ctr}</div>
																<div>AM<input type="checkbox" name="am" value="${ctr}"/>
																PM<input type="checkbox" name="pm" value="${ctr}"/></div></td>
															</c:when>
															<c:otherwise>
																<td id="day${ctr}" class='calendar-day-form'><div>${ctr}</div>
																<div>AM<input type="checkbox" name="am" value="${ctr}"/>
																PM<input type="checkbox" name="pm" value="${ctr}"/></div></td>
															</c:otherwise>
														</c:choose>
														<c:set var="ctr" value="${ctr + 1}" />
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tr>
									</c:forEach>
								</table></li>

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
										<form:errors class="gfield_description validation_message"
											path="type" />
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
											<form:errors class="gfield_description validation_message"
												path="postalCode" />
										</spring:bind> </span>
									<div class="gf_clear gf_clear_complex"></div>
								</div> <form:errors class="gfield_description validation_message"
									path="address" /></li>

							<c:choose>
								<c:when test="${role == 'Staff'}">
									<li id="field_6_04"
										class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.dropError}"><label
										class="gfield_label gfield_label_before_complex"
										for="input_6_1_3">Drop Fee</label> <span
										class="ginput_left address_zip" id="input_6_2_5_container4"><spring:bind
												path="dropFee">
												<form:input path="dropFee" id="dropFee" />
												<form:errors class="gfield_description validation_message"
													path="dropFee" />
											</spring:bind></span></li>

									<li id="field_6_05"
										class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.receiverError}"><label
										class="gfield_label gfield_label_before_complex"
										for="input_6_1_3">Receiver ID</label> <span
										class="ginput_left address_zip" id="input_6_2_5_container5"><spring:bind
												path="receiver">
												<form:input path="receiver" id="receiver" />
												<form:errors class="gfield_description validation_message"
													path="receiver" />
											</spring:bind></span></li>

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
												<form:errors class="gfield_description validation_message"
													path="status" />
											</spring:bind> </span></li>
								</c:when>
								<c:otherwise>
									<form:hidden path="dropFee" />
									<form:hidden path="receiver" />
									<form:hidden path="status" />
								</c:otherwise>
							</c:choose>

							<li id="field_6_7"
								class="gfield gfield_price gfield_price_6_7 gfield_product_6_7 field_sublabel_below field_description_below gfield_visibility_visible"><label
								class="gfield_label" for="input_6_7">Would you like to
									receive a tax receipt for your donation? </label> <spring:bind
									path="receipts">
									<form:checkbox path="receipts" id="receipts" />
								</spring:bind></li>

							<li id="field_6_8"
								class="gfield gfield_price gfield_price_6_7 gfield_product_6_7 field_sublabel_below field_description_below gfield_visibility_visible"><label
								class="gfield_label" for="input_6_7">Item Images</label>
								<div class="gf_clear gf_clear_complex"></div> <c:choose>
									<c:when test="${noImage == true}">
										<p>No images</p>
									</c:when>
									<c:otherwise>
										<c:set var="imagediv" value="${1}" />
										<c:forEach var="imageIds" items="${imageIds}">
											<div class="imagediv${imagediv}">
												<spring:url value="/images/${imageIds}" var="imageUrl" />
												<img src="${imageUrl}" /><br />
												<spring:url value="/images/${imageIds}/delete"
													var="deleteUrl" />
												<button formaction="${deleteUrl}">Delete Image</button>
											</div>
											<c:choose>
												<c:when test="${imagediv == 1}">
													<c:set var="imagediv" value="${2}" />
												</c:when>
												<c:otherwise>
													<c:set var="imagediv" value="${1}" />
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:otherwise>
								</c:choose></li>

							<li id="field_6_9"
								class="gfield gfield_price gfield_price_6_7 gfield_product_6_7 field_sublabel_below field_description_below gfield_visibility_visible ${donationForm.fileError}">
								<c:if
									test="${donationForm.numImages >= 0 && donationForm.numImages <= 3}">
									<span id="fileUp1" style="display: block"> <label
										class="gfield_label" for="input_6_7">Upload an image:</label>
										<spring:bind path="file1">
											<form:input type="file" path="file1" id="file1"
												onchange="showFile2()" />
											<form:errors class="gfield_description validation_message"
												path="file1" />
											<br />
										</spring:bind>
									</span>
								</c:if> <c:if
									test="${donationForm.numImages >= 0 && donationForm.numImages <= 2}">
									<span id="fileUp2" style="display: none"> <label
										class="gfield_label" for="input_6_7">Upload an image:</label>
										<spring:bind path="file2">
											<form:input type="file" path="file2" id="file2"
												onchange="showFile3()" />
											<form:errors class="gfield_description validation_message"
												path="file2" />
											<br />
										</spring:bind>
									</span>
								</c:if> <c:if
									test="${donationForm.numImages == 0 || donationForm.numImages == 1}">
									<span id="fileUp3" style="display: none"> <label
										class="gfield_label" for="input_6_7">Upload an image:</label>
										<spring:bind path="file3">
											<form:input type="file" path="file3" id="file3"
												onchange="showFile4()" />
											<form:errors class="gfield_description validation_message"
												path="file3" />
											<br />
										</spring:bind>
									</span>
								</c:if> <c:if test="${donationForm.numImages == 0}">
									<span id="fileUp4" style="display: none"> <label
										class="gfield_label" for="input_6_7">Upload an image:</label>
										<spring:bind path="file4">
											<form:input type="file" path="file4" id="file4" />
											<form:errors class="gfield_description validation_message"
												path="file4" />
											<br />
										</spring:bind>
									</span>
								</c:if>
							</li>

						</ul>

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

<script type="text/javascript">
	function showFile2() {
		document.getElementById("fileUp2").style.display = 'block';
	}

	function showFile3() {
		document.getElementById("fileUp3").style.display = 'block';
	}

	function showFile4() {
		document.getElementById("fileUp4").style.display = 'block';
	}
</script>

</html>

