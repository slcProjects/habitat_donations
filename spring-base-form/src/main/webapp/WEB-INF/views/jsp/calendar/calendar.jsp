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
		
			<h1>Donation Calendar</h1>
			
			<h3>${month}</h3>
			
			<c:set var = "ctr" value = "${1}"/>
						
			<table style='border: 2px solid black'>
				<thead>
					<tr style='border: 2px solid black'>
						<th style='border: 2px solid black'>Sunday</th>
						<th style='border: 2px solid black'>Monday</th>
						<th style='border: 2px solid black'>Tuesday</th>
						<th style='border: 2px solid black'>Wednesday</th>
						<th style='border: 2px solid black'>Thursday</th>
						<th style='border: 2px solid black'>Friday</th>
						<th style='border: 2px solid black'>Saturday</th>
					</tr>
				</thead>
				<c:forEach begin="1" end="${weeksInMonth}" step="1" var="week">
        			<tr id="week${week}" style='border: 2px solid black'>
        				<c:forEach begin="1" end="7" step="1" var="dayInWeek">
							<c:choose>
								<c:when test="${ctr > daysInMonth || week == 1 && first > dayInWeek}">
									<td class = 'emptyday' style='border: 2px solid black'></td>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${ctr == day}">
											<td id="day${ctr}" class='today' style='border: 2px solid black'>
												${ctr}
											</td>
										</c:when>
										<c:otherwise>
											<td id="day${ctr}" style='border: 2px solid black'>
												${ctr}
											</td>
										</c:otherwise>
									</c:choose>
									<c:set var = "ctr" value = "${ctr + 1}"/>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</tr>
   				</c:forEach>
			</table>
			
			<p>
				<spring:url value="/last" var="lastUrl" />
				<button class="btn btn-info" onclick="location.href='${lastUrl}'">Last Month</button>
			
				<spring:url value="/next" var="nextUrl" />
				<button class="btn btn-info" onclick="location.href='${nextUrl}'">Next Month</button>
			</p>
			
			<spring:url value="/dashboard" var="dashboardUrl" />
			<button class="btn btn-info" onclick="location.href='${dashboardUrl}'">Staff Dashboard</button>

			<spring:url value="/logout" var="logoutUrl" />
			<button class="btn btn-info" onclick="location.href='${logoutUrl}'">Log Out</button>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

