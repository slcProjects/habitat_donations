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
		
			<c:choose>
				<c:when test="${userForm['new']}">
					<h1>Register User</h1>
				</c:when>
				<c:otherwise>
					<h1>Update User</h1>
				</c:otherwise>
			</c:choose>
			<br />

			<div class="gf_browser_chrome gform_wrapper" id="gform_wrapper_6">
				<spring:url value="/users" var="userActionUrl" />

				<form:form method="post" modelAttribute="userForm"
					action="${userActionUrl}">
					<form:hidden path="id" />
					<div class="gform_heading">
						<span class="gform_description"></span>
					</div>
					<div class="gform_body">
						<ul id="gform_fields_6"
							class="gform_fields top_label form_sublabel_below description_below">

							<li id="field_6_0"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${userForm.loginError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Login Name<span
									class="gfield_required">*</span></label> <span
								class="ginput_left address_zip" id="input_6_2_5_container"><spring:bind
										path="loginName">
										<form:input path="loginName" type="text" id="loginName" />
										<form:errors class="gfield_description validation_message" path="loginName" />
										<div class="gf_clear gf_clear_complex"></div>
									</spring:bind> </span></li>

							<li id="field_6_0.1"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${userForm.passError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">New Password
								<c:if test="${userForm['new']}">
									<span class="gfield_required">*</span>
								</c:if></label>
								<form:hidden path="currentPass" />
								<div
									class="ginput_complex ginput_container no_prefix has_first_name no_middle_name has_last_name no_suffix gf_name_has_2 ginput_container_name gfield_trigger_change"
									id="input_6_1">
									<span id="input_6_1_3_container" class="name_first"><spring:bind
											path="password">
											<form:password path="password" id="password" />
											<label for="input_6_1_3">Password</label>
										</spring:bind> </span> <span id="input_6_1_6_container" class="name_last"><spring:bind
											path="confirmPassword">
											<form:password path="confirmPassword" id="confirmPassword" />
											<label for="input_6_1_6">Confirm Password</label>
										</spring:bind></span>
								</div>
								<form:errors class="gfield_description validation_message" path="password" /></li>

							<li id="field_6_1"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${userForm.nameError}"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Name<span class="gfield_required">*</span></label>
								<div
									class="ginput_complex ginput_container no_prefix has_first_name no_middle_name has_last_name no_suffix gf_name_has_2 ginput_container_name gfield_trigger_change"
									id="input_6_1">
									<span id="input_6_1_3_container" class="name_first"><spring:bind
											path="firstName">
											<form:input path="firstName" id="firstName" />
											<label for="input_6_1_3">First</label>
										</spring:bind> </span> <span id="input_6_1_6_container" class="name_last"><spring:bind
											path="lastName">
											<form:input path="lastName" id="lastName" />
											<label for="input_6_1_6">Last</label>
										</spring:bind></span>
								</div>
								<form:errors class="gfield_description validation_message" path="firstName" /></li> 

							<li id="field_6_3"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${userForm.contactError}"><label
								class="gfield_label gfield_label_before_complex" for="input_6_3">Contact
									Info<span class="gfield_required">*</span>
							</label>
								<div
									class="ginput_complex ginput_container ginput_container_email"
									id="input_6_3_container">
									<span id="input_6_3_1_container" class="ginput_left"> <spring:bind
											path="email">
											<form:input path="email" id="email" />
											<label for="input_6_3_2">Email Address</label>
											<form:errors class="gfield_description validation_message"
												path="email" />
										</spring:bind>
									</span> <span id="input_6_3_2_container" class="ginput_right">
										<spring:bind path="phone">
											<form:input path="phone" id="phone" />
											<label for="input_6_3_2">Phone Number</label>
											<form:errors class="gfield_description validation_message"
												path="phone" />
										</spring:bind>
									</span>
									<div class="gf_clear gf_clear_complex"></div>
								</div></li>

							 <li id="field_6_2"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${userForm.addrError}"><label
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
										</spring:bind> </span>
									<div class="gf_clear gf_clear_complex"></div>
								</div>
								<form:errors class="gfield_description validation_message" path="address" /></li>
								
							<c:choose>
								<c:when test="${not empty role && role == 'Staff'}">
									<li id="field_6_6"
										class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible ${userForm.roleError}"><label
										class="gfield_label gfield_label_before_complex"
										for="input_6_1_3">Role<span class="gfield_required">*</span></label>
										<span class="ginput_left address_zip"><spring:bind
												path="role">
												<form:select path="role">
													<form:option value="NONE" label="" />
													<form:options items="${roleList}" />
												</form:select>
												<form:errors class="gfield_description validation_message" path="role" />
												<div class="gf_clear gf_clear_complex"></div>
											</spring:bind> </span></li>
								</c:when>
								<c:otherwise>
									<form:hidden path="role" />
								</c:otherwise>
							</c:choose>

							<li id="field_6_7"
								class="gfield gfield_price gfield_price_6_7 gfield_product_6_7 field_sublabel_below field_description_below gfield_visibility_visible"><label
								class="gfield_label" for="input_6_7">Would you like to
									receive ReStore Notifications? </label> <spring:bind path="notify">
									<form:checkbox path="notify" id="notify" />
								</spring:bind></li>
								
						</ul>
						
					</div>
					
					<div class="gform_footer top_label">
						<c:choose>
							<c:when test="${userForm['new']}">
								<button type="submit">Submit Detail</button>
							</c:when>
							<c:otherwise>
								<button type="submit">Update</button>
							</c:otherwise>
						</c:choose>
					</div>
					
				</form:form>
				
			</div>

			<spring:url value="/dashboard" var="dashboardUrl" />

			<c:choose>
				<c:when test="${not empty role}">
					<c:choose>
						<c:when test="${role == 'Staff'}">
							<spring:url value="/users" var="donationList" />
							<button class="btn btn-info"
								onclick="location.href='${donationList}'">View All
								Users</button>
							<button class="btn btn-info"
								onclick="location.href='${dashboardUrl}'">Staff
								Dashboard</button>
						</c:when>
						<c:otherwise>
							<c:if test="${role != 'Staff' && not empty role}">
								<button class="btn btn-info"
									onclick="location.href='${dashboardUrl}'">User
									Dashboard</button>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<p>Already registered? Log in below!</p>
					<spring:url value="/main" var="loginUrl" />
					<button class="btn btn-info" onclick="location.href='${loginUrl}'">Login</button>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>