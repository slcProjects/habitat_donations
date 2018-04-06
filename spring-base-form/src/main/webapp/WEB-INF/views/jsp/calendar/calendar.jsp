<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/head.jsp" />
<body>
	<jsp:include page="../fragments/header.jsp" />
	<div class="content_body" style="margin-top: 156px">
		<div class="container">

			<h1>Donation Calendar</h1>

			<h3>${monthName} ${year}</h3>

			<p>Number of donations this month: ${fn:length(donations)}</p>

			<c:set var="ctr" value="${1}" />

			<table>
				<thead>
					<tr>
						<th></th>
						<th>Sunday</th>
						<th>Monday</th>
						<th>Tuesday</th>
						<th>Wednesday</th>
						<th>Thursday</th>
						<th>Friday</th>
						<th>Saturday</th>
					</tr>
				</thead>
				<c:forEach begin="1" end="${weeksInMonth}" step="1" var="week">
					<tr id="week${week}">
						<c:forEach begin="0" end="7" step="1" var="dayInWeek">
							<c:choose>
								<c:when test="${dayInWeek == 0}">
									<td class='calendar-day-np week'>
										<spring:url value="/calendar/weekof/${ctr}/${month}/${year}" var="weekUrl" />
										<button onclick="location.href='${weekUrl}'">View This Week</button>
									</td>
								</c:when>
								<c:when
									test="${ctr > daysInMonth || week == 1 && first > dayInWeek && dayInWeek != 0}">
									<td class='calendar-day-np'></td>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${ctr == day}">
											<td id="day${ctr}" class='calendar-day today'><spring:url
													value="/schedule/${month}/${ctr}/${year}" var="schedule" />
												<button class='day-number'
													onclick="location.href='${schedule}'">${ctr}</button> <c:if
													test="${not empty donations}">
													<c:forEach var="donation" items="${donations}">
														<c:forEach var="scheduledDate" items="${donation.scheduledDate}">
															<fmt:formatDate value="${scheduledDate}"
																pattern="d" var="scheduledDay" />
															<c:if test="${scheduledDay == ctr}">
																<c:forEach var="meridian" items="${donation.meridian}">
																	<spring:url value="/donations/${donation.id}"
																		var="donationUrl" />
																	<a class="donlink" href="${donationUrl}" 
																		title="${monthName} ${ctr} ${meridian} ${donation.type} ${donation.donorName}, ${donation.description}, Status: ${donation.status}">
																		ID #${donation.id}: ${meridian}</a>
																</c:forEach>
															</c:if>
														</c:forEach>
													</c:forEach>
												</c:if></td>
										</c:when>
										<c:otherwise>
											<td id="day${ctr}" class='calendar-day'><spring:url
													value="/schedule/${month}/${ctr}/${year}" var="schedule" />
												<button class='day-number'
													onclick="location.href='${schedule}'">${ctr}</button> <c:if
													test="${not empty donations}">
													<c:forEach var="donation" items="${donations}">
														<c:forEach var="scheduledDate" items="${donation.scheduledDate}">
															<fmt:formatDate value="${scheduledDate}"
																pattern="d" var="scheduledDay" />
															<c:if test="${scheduledDay == ctr}">
																<c:forEach var="meridian" items="${donation.meridian}">
																	<spring:url value="/donations/${donation.id}"
																		var="donationUrl" />
																	<a class="donlink" href="${donationUrl}" 
																		title="${monthName} ${ctr} ${meridian} ${donation.type} ${donation.donorName}, ${donation.description}, Status: ${donation.status}">
																		ID #${donation.id}: ${meridian}</a>
																</c:forEach>
															</c:if>
														</c:forEach>
													</c:forEach>
												</c:if></td>
										</c:otherwise>
									</c:choose>
									<c:set var="ctr" value="${ctr + 1}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>

			<p>
				<spring:url value="/calendar/${month}/${year}/last" var="lastUrl" />
				<button class="btn btn-info" onclick="location.href='${lastUrl}'">Last
					Month</button>

				<spring:url value="/calendar/${month}/${year}/next" var="nextUrl" />
				<button class="btn btn-info" onclick="location.href='${nextUrl}'">Next
					Month</button>
			</p>

			<spring:url value="/dashboard" var="dashboardUrl" />
			<button class="btn btn-info"
				onclick="location.href='${dashboardUrl}'">Staff Dashboard</button>

			<spring:url value="/logout" var="logoutUrl" />
			<button class="btn btn-info" onclick="location.href='${logoutUrl}'">Log
				Out</button>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>

