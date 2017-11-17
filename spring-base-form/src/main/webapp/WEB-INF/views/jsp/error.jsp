<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="fragments/header.jsp" />

	<div class="container" style="margin-top: 156px">

		<h1>Error Page!!!!!!</h1>

		<p>${exception.message}</p>
		<!-- Exception: ${exception.message}.
		  	<c:forEach items="${exception.stackTrace}" var="stackTrace"> 
				${stackTrace} 
			</c:forEach>
	  	-->
	  	
	  	<spring:url value="/users" var="userUrl" /> 
		<spring:url value="/donations" var="donationUrl" />
						
	  	<button class="btn btn-info" onclick="location.href='${userUrl}'">Users</button>
	  	<button class="btn btn-info" onclick="location.href='${donationUrl}'">Donations</button>

	</div>

	<jsp:include page="fragments/footer.jsp" />

</body>
</html>