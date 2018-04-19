<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
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

			<h1>Donation Analytics: ${type}</h1>
			<c:choose>
				<c:when test="${empty analytics}">
					<p>No donations found</p>
				</c:when>
				<c:otherwise>
					<table id="analytictable">
						<thead>
							<tr>
								<th>Value</th>
								<th>Count</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="analytic" items="${analytics}">
								<tr>
									<td>${analytic.value}</td>
									<td>${analytic.count}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<spring:url value="/analytics/${type}/export" var="exportUrl" />
					<form method="post" action="${exportUrl}">
						<button type="submit">Export to Excel Spreadsheet</button>
					</form>
				</c:otherwise>
			</c:choose>

			<spring:url value="/analytics" var="analyticUrl" />
			<button class="btn btn-info" onclick="location.href='${analyticUrl}'">Analytics Menu</button>
			<spring:url value="/dashboard" var="dashboardUrl" />
			<button class="btn btn-info"
				onclick="location.href='${dashboardUrl}'">Staff Dashboard</button>
		</div>
	</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>

<script type="text/javascript">
	$(document).ready( function () {
    	$('#analytictable').DataTable();
	} );
</script>

</html>