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
		
			<c:if test="${not empty msg}">
				<div class="alert alert-${css} alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>${msg}</strong>
				</div>
			</c:if>
			
			<c:if test="${not empty file1}">
				<div class="alert alert-${css} alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>${file1}</strong>
				</div>
			</c:if>
			
			<c:if test="${not empty file2}">
				<div class="alert alert-${css} alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>${file2}</strong>
				</div>
			</c:if>
			
			<c:if test="${not empty file3}">
				<div class="alert alert-${css} alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>${file3}</strong>
				</div>
			</c:if>
			
			<c:if test="${not empty file4}">
				<div class="alert alert-${css} alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>${file4}</strong>
				</div>
			</c:if>
			
			<c:if test="${not empty max}">
				<div class="alert alert-${css} alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>${max}</strong>
				</div>
			</c:if>

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

