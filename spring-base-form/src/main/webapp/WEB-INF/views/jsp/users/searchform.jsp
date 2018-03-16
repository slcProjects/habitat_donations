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

			<h1>User Search Form</h1>
			<br />

			<div class="gf_browser_chrome gform_wrapper" id="gform_wrapper_6">
				<spring:url value="/users/searchresult" var="userActionUrl" />

				<form:form class="form-horizontal" method="post"
					modelAttribute="searchForm" action="${userActionUrl}">
					<div class="gform_heading">
						<span class="gform_description"></span>
					</div>
					<div class="gform_body">
						<ul id="gform_fields_6"
							class="gform_fields top_label form_sublabel_below description_below">

							<li id="field_6_1"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Name</label>
								<div
									class="ginput_complex ginput_container no_prefix has_first_name no_middle_name has_last_name no_suffix gf_name_has_2 ginput_container_name gfield_trigger_change"
									id="input_6_1">
									<span id="input_6_1_3_container" class="name_first"><spring:bind
											path="firstName">
											<form:input path="firstName" id="firstName" />
											<label for="input_6_1_3">First</label>
											<form:errors path="firstName" />
										</spring:bind> </span> <span id="input_6_1_6_container" class="name_last"><spring:bind
											path="lastName">
											<form:input path="lastName" id="lastName" />
											<label for="input_6_1_6">Last</label>
											<form:errors path="lastName" />
										</spring:bind></span>
								</div></li>

							<li id="field_6_2"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_2_1">Location</label>
								<div
									class="ginput_complex ginput_container has_street has_street2 has_city has_state has_zip ginput_container_address gfield_trigger_change"
									id="input_6_2">
									<span class="ginput_left address_city"
										id="input_6_2_3_container"> <spring:bind path="city">
											<form:input path="city" id="city" />
											<label for="input_6_2_3" id="input_6_2_3_label">City</label>
											<form:errors path="city" />
										</spring:bind>
									</span><span class="ginput_right address_zip"
										id="input_6_2_5_container"><spring:bind
											path="postalCode">
											<form:input path="postalCode" id="postalCode" />
											<label for="input_6_2_5" id="input_6_2_5_label">Postal
												Code</label>
											<form:errors path="postalCode" />
										</spring:bind> </span>
									<div class="gf_clear gf_clear_complex"></div>
								</div></li>

							<li id="field_6_6"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Role</label> <span
								class="ginput_left address_zip"><spring:bind path="role">
										<form:input path="role" type="text" id="role" />
										<form:errors path="role" class="control-label" />
										<div class="gf_clear gf_clear_complex"></div>
									</spring:bind> </span></li>

						</ul>

					</div>

					<div class="gform_footer top_label">
						<button type="submit">Search</button>
					</div>

				</form:form>

			</div>

			<spring:url value="/dashboard" var="dashboardUrl" />
			<spring:url value="/users" var="donationList" />
			<button class="btn btn-info"
				onclick="location.href='${donationList}'">View All Users</button>
			<button class="btn btn-info"
				onclick="location.href='${dashboardUrl}'">Staff Dashboard</button>

		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>