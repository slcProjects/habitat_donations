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

			<h1>Log In Page</h1>

			<div class="gf_browser_chrome gform_wrapper" id="gform_wrapper_6">

				<spring:url value="/login" var="login" />

				<form:form class="form-horizontal" method="post"
					modelAttribute="loginForm" action="${login}">

					<div class="gform_heading">
						<span class="gform_description"></span>
					</div>
					<div class="gform_body">
						<ul id="gform_fields_6"
							class="gform_fields top_label form_sublabel_below description_below">

							<li id="field_6_0"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Username</label> <span
								class="ginput_full address_line_1" id="input_6_2_5_container"><spring:bind
										path="username">
										<form:input path="username" id="username" />
										<form:errors path="username" />
										<div class="gf_clear gf_clear_complex"></div>
									</spring:bind> </span></li>

							<li id="field_6_02"
								class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
								class="gfield_label gfield_label_before_complex"
								for="input_6_1_3">Password</label> <span
								class="ginput_left address_zip" id="input_6_2_5_container2"><spring:bind
										path="password">
										<form:password path="password" id="password" />
										<form:errors path="password" />
										<div class="gf_clear gf_clear_complex"></div>
									</spring:bind> </span></li>
						</ul>

						<button type="submit">Log In</button>
					</div>

				</form:form>

				<p>New donor? Register today!</p>
				<spring:url value="/users/register" var="registerUrl" />
				<button class="btn btn-info"
					onclick="location.href='${registerUrl}'">Register</button>

			</div>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>