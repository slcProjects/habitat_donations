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
			<h1>Confirmation Page</h1>

			<p>Thank you for Registering with us. Your donation is
				appreciated!</p>

			<spring:url value="/users" var="userList" />
			<button class="btn btn-info" onclick="location.href='${userList}'">View
				all users</button>
			<spring:url value="/donations" var="donationUrl" />
			<button class="btn btn-info" onclick="location.href='${donationUrl}'">Received
				Donations</button>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

