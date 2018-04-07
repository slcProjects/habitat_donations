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

			<h1>Staff Dashboard</h1>
			<div class="container-staff-dashboard">
				<div data-vc-full-width="true" data-vc-full-width-init="true"
					class="vc_row wpb_row vc_row-fluid center vc_custom_1513264566725 vc_row-o-equal-height vc_row-o-content-middle vc_row-flex ult-vc-hide-row vc_row-has-fill"
					data-rtl="false"
					style="position: relative; left: -115px; box-sizing: border-box; width: 980px; padding-left: 115px; padding-right: 115px; background-image: none !important;"
					data-row-effect-mobile-disable="true">
					<div class="upb_row_bg" data-bg-override="ex-full"
						style="background: rgb(247, 243, 234); min-width: 980px; left: 0px; width: 980px;"></div>
					<div class="wpb_column vc_column_container vc_col-sm-6">
						<div class="vc_column-inner ">
							<div class="wpb_wrapper">
								<div
									class="wpb_single_image wpb_content_element vc_align_center">

									<figure class="wpb_wrapper vc_figure"></figure>
								</div>
								<div class="boc_spacing " style="height: 20px"></div>
								<div class="wpb_text_column wpb_content_element ">
									<div class="wpb_wrapper">
										<p style="text-align: center;">
											<strong>Donate Something today!!</strong>
										</p>
										<p>
										Want to make donation click button below. It will open new page with donation form
										</p>
									</div>
								</div>
								<spring:url value="/donations/${userId}/add" var="donateUrl" />
								<button onclick="location.href='${donateUrl}'">Donate</button>

								<div
									class="wpb_single_image wpb_content_element vc_align_center">
									<figure class="wpb_wrapper vc_figure"></figure>
								</div>
								<div class="boc_spacing " style="height: 20px"></div>
								<div class="wpb_text_column wpb_content_element ">
									<div class="wpb_wrapper">
										<p style="text-align: center;">
											<strong>see what you donated</strong>
										</p>
										<p>
										See all the donations made...till now
										</p>
									</div>
								</div>
								<spring:url value="/donationsforuser" var="forUserUrl" />
								<button onclick="location.href='${forUserUrl}'">View
									Your Donations</button>


								<div
									class="wpb_single_image wpb_content_element vc_align_center">
									<figure class="wpb_wrapper vc_figure"></figure>
								</div>
								<div class="boc_spacing " style="height: 20px"></div>
								<div class="wpb_text_column wpb_content_element ">
									<div class="wpb_wrapper">
										<p style="text-align: center;">
											<strong>Find any user</strong>
										</p>
										<p>
										Search for user details or donor Details
										</p>
									</div>
								</div>
								<spring:url value="/users/searchform" var="userSearch" />
								<button class="btn btn-info"
									onclick="location.href='${userSearch}'">User Search</button>


								<div
									class="wpb_single_image wpb_content_element vc_align_center">
									<figure class="wpb_wrapper vc_figure"></figure>
								</div>
								<div class="boc_spacing " style="height: 20px"></div>
								<div class="wpb_text_column wpb_content_element ">
									<div class="wpb_wrapper">
										<p style="text-align: center;">
											<strong>scroll through all users</strong>
										</p>
										<p>
										view all the donor's details
										</p>
									</div>
								</div>
								<spring:url value="/users" var="users" />
								<button class="btn btn-info" onclick="location.href='${users}'">View
									all users</button>


								<div
									class="wpb_single_image wpb_content_element vc_align_center">
									<figure class="wpb_wrapper vc_figure"></figure>
								</div>
								<div class="boc_spacing " style="height: 20px"></div>
								<div class="wpb_text_column wpb_content_element ">
									<div class="wpb_wrapper">
										<p style="text-align: center;">
											<strong>scroll through all Donations</strong>
										</p>
										<p>
										View all the donations, made at store or picked up from donor location
										</p>
									</div>
								</div>
								<spring:url value="/donations" var="donations" />
								<button class="btn btn-info"
									onclick="location.href='${donations}'">View all
									donations</button>


								<div
									class="wpb_single_image wpb_content_element vc_align_center">
									<figure class="wpb_wrapper vc_figure"></figure>
								</div>
								<div class="boc_spacing " style="height: 20px"></div>
								<div class="wpb_text_column wpb_content_element ">
									<div class="wpb_wrapper">
										<p style="text-align: center;">
											<strong>What is Today's Schedule Check here</strong>
										</p>
										<p>
											See all the donation to be made at store or picked up for today's date
										</p>
									</div>
								</div>
								<spring:url value="/schedule/${month}/${day}/${year}"
									var="schedule" />
								<button class="btn btn-info"
									onclick="location.href='${schedule}'">View today's
									schedule</button>


								<div
									class="wpb_single_image wpb_content_element vc_align_center">
									<figure class="wpb_wrapper vc_figure"></figure>
								</div>
								<div class="boc_spacing " style="height: 20px"></div>
								<div class="wpb_text_column wpb_content_element ">
									<div class="wpb_wrapper">
										<p style="text-align: center;">
											<strong>Check Calender</strong>
										</p>
										<p>
										you can reach to calender you can see all upcoming donations or previous made donations 
										</p>
									</div>
								</div>
								<spring:url value="/calendar/${month}/${year}/current"
									var="calendar" />
								<button class="btn btn-info"
									onclick="location.href='${calendar}'">View calendar</button>


								<div
									class="wpb_single_image wpb_content_element vc_align_center">
									<figure class="wpb_wrapper vc_figure"></figure>
								</div>
								<div class="boc_spacing " style="height: 20px"></div>
								<div class="wpb_text_column wpb_content_element ">
									<div class="wpb_wrapper">
										<p style="text-align: center;">
											<strong>Good bye!!</strong>
										</p>
										<p>
										You can end your session from here, always welcomed again..!!
										</p>
									</div>
								</div>
								<spring:url value="/logout" var="logoutUrl" />
								<button class="btn btn-info"
									onclick="location.href='${logoutUrl}'">Log Out</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>