<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
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

		<h1>All Users </h1>

 		<table style='border: 2px solid black'>
			<thead>
				<tr style='border: 2px solid black'>
					<th style='border: 2px solid black'>#ID</th>
					<th style='border: 2px solid black'>LoginName</th>
					<th style='border: 2px solid black'>Email</th>
					<th style='border: 2px solid black'>Role</th>
					<th style='border: 2px solid black'>Actions</th>
				</tr>
			</thead>
 
			<c:forEach var="user" items="${users}">
				<%-- <tr>
					<td>
						${user.id}
					</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td><c:forEach var="framework" items="${user.framework}" varStatus="loop">
						${framework}
    					<c:if test="${not loop.last}">,</c:if>
						</c:forEach></td>
					<td>
						<spring:url value="/users/${user.id}" var="userUrl" />
						<spring:url value="/users/${user.id}/delete" var="deleteUrl" /> 
						<spring:url value="/users/${user.id}/update" var="updateUrl" />
						
  --%>
				<tr style='border: 2px solid black'>
					<td style='border: 2px solid black'>${user.id}</td>
					<td style='border: 2px solid black'>${user.loginName}</td>
					<td style='border: 2px solid black'>${user.email}</td>
					<td style='border: 2px solid black'>${user.role}</td>
<<<<<<< HEAD
					<td style='border: 2px solid black'><spring:url
							value="/users/${user.id}" var="userUrl" /> <spring:url
							value="/users/${user.id}/delete" var="deleteUrl" /> <spring:url
							value="/users/${user.id}/update" var="updateUrl" />
=======
					<td style='border: 2px solid black'>
						<spring:url value="/users/${user.id}" var="userUrl" /> 
						<spring:url value="/users/${user.id}/delete" var="deleteUrl" /> 
						<spring:url value="/users/${user.id}/update" var="updateUrl" />
						<spring:url value="/users/${user.id}/donate" var="donateUrl" />

>>>>>>> branch 'master' of https://github.com/slcProjects/habitat_donations
						<button onclick="location.href='${userUrl}'">Query</button>
						<button onclick="location.href='${updateUrl}'">Update</button>
<<<<<<< HEAD
						<button onclick="location.href='${deleteUrl}'">Delete</button>
=======
<%-- 						<button onclick="location.href='${deleteUrl}'">Delete</button> --%>
						<button>Delete</button>
						<c:if test="${user.role=='Donor'}">
<%-- 							<button onclick="location.href='${donateUrl}'">Donate</button> --%>
							<button>Donate</button>
						</c:if>
>>>>>>> branch 'master' of https://github.com/slcProjects/habitat_donations
					</td>
				</tr>
			</c:forEach>
		    </table>
		
		<spring:url value="/users/add" var="urlAddUser" />
		<button class="btn btn-info" onclick="location.href='${urlAddUser}'">Add New User</button>
<<<<<<< HEAD
		
		<spring:url value="/users/donation.jsp" var="urlDonation" />
		<button class="btn btn-info" onclick="location.href='${urlDonation}'">Donation Page</button>		
=======
		<spring:url value="/donations" var="donationUrl" />
		<button class="btn btn-info" onclick="location.href='${donationUrl}'">View Donations</button>

>>>>>>> branch 'master' of https://github.com/slcProjects/habitat_donations
	</div>
</div>

</body>
</html>