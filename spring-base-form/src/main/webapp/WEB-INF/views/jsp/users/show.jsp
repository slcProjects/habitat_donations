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

			<h1>User Detail</h1>
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
							<div>${user.id}</div>
						</li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
							class="gfield_label">Login Name</label>
							<div>${user.loginName}</div></li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
							class="gfield_label">Full Name</label>
							<div>${user.firstName}${user.lastName}</div></li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
							class="gfield_label">Email</label>
							<div>${user.email}</div></li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
							class="gfield_label">Phone</label>
							<div>${user.phone}</div></li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
							class="gfield_label">Address</label>
							<div>${user.address}${user.city},${user.province},
								${user.postalCode}</div></li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
							class="gfield_label">Role</label>
							<div>${user.role}</div></li>

						<li
							class="gfield gfield_contains_required field_sublabel_below field_description_below gfield_visibility_visible"><label
							class="gfield_label">Receives Notifications</label>
							<div>
								<c:choose>
									<c:when test="${user.notify}">
										<p>Yes</p>
									</c:when>
									<c:otherwise>
										<p>No</p>
									</c:otherwise>
								</c:choose>
							</div></li>

					</ul>

					<spring:url value="/users/${user.id}/update" var="updateUrl" />
					<button onclick="location.href='${updateUrl}'">Edit User
						Detail</button>

					<spring:url value="/dashboard" var="dashboardUrl" />

					<c:choose>
						<c:when test="${role == 'Staff'}">
							<spring:url value="/users" var="userList" />
							<spring:url value="/users/searchform" var="userSearch" />
							<button class="btn btn-info"
								onclick="location.href='${userSearch}'">User Search</button>
							<button class="btn btn-info"
								onclick="location.href='${userList}'">View all users</button>
							<button class="btn btn-info"
								onclick="location.href='${dashboardUrl}'">Staff
								Dashboard</button>
						</c:when>
						<c:otherwise>
							<spring:url value="/donations/${user.id}/add" var="donateUrl" />
							<button onclick="location.href='${donateUrl}'">Donate</button>
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