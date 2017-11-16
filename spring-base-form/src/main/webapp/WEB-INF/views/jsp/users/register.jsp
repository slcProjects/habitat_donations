<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/header.jsp" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body>

<div class="bodyContainer">
		 <div class="loginBox">
		   <label class="col-sm-2">Login</label>
		 </div>
		 
	<div class="signUpBox">
			    <div class="row">
					<label class="col-sm-2">First Name</label>
					<div class="col-sm-10">${user.firstName}</div>
				</div>
			
				<div class="row">
					<label class="col-sm-2">Last Name</label>
					<div class="col-sm-10">${user.lastName}</div>
				</div>
				 <div class="row">
					<label class="col-sm-2">Email Id</label>
					<div class="col-sm-10">${user.email}</div>
				</div>
			
				<div class="row">
					<label class="col-sm-2">Cell</label>
					<div class="col-sm-10">${user.phone}</div>
				</div>
				<div class="row">
					<label class="col-sm-2">Address</label>
					<div class="col-sm-10">${user.address}</div>
				</div>
			
				<div class="row">
					<label class="col-sm-2">Province</label>
					<div class="col-sm-10">${user.province}</div>
				</div>
				 <div class="row">
					<label class="col-sm-2">City</label>
					<div class="col-sm-10">${user.city}</div>
				</div>
			
				<div class="row">
					<label class="col-sm-2">Postal Code</label>
					<div class="col-sm-10">${user.postalCode}</div>
				</div>
				
				<div class="row">
					<label class="col-sm-2">Would you like to recieve Restore Notification?</label>
					<div class="col-sm-10">${user.notify}</div>
				</div>
	</div>	
	
</div>

<jsp:include page="../fragments/footer.jsp" />
</body>
</html>