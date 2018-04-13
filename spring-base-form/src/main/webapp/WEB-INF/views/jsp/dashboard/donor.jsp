<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
		<h1 style="text-transform: uppercase;
					   text-align: center">Donor Dashboard</h1>
					   <div class="container-donor-dashboard" style="text-align:center">
							<button class="btn btn-info"
							 onclick="location.href='/spring-base-form-initial_load/donations/2/add'">
							 <i class="material-icons">shopping_cart</i> Donate
							</button>
							
							<button class="btn btn-info"
							onclick="location.href='/spring-base-form-initial_load/users/2'">
							<i class="material-icons">supervisor_account</i> View User</button>

							<button class="btn btn-info" 
							onclick="location.href='/spring-base-form-initial_load/donationsforuser'">
							<i class="material-icons">description</i> View Your Donations
								</button>

							<button class="btn btn-info"
								onclick="location.href='/spring-base-form-initial_load/logout'">
								<i class="material-icons">power_settings_new</i> Log Out</button>
</div>
						</div>
					</div>
	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>