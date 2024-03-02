<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="/image/x-icon" href="assets/favicon.ico">
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/js/scripts.js"></script>
</head>
<body>
	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>과목명</th>
					<th>요일</th>
					<th>시작시간</th>
					<th>마침시간</th>
					<th>담당교수</th>
					<th>재수강 여부</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sugangList}" var="su" varStatus="status">
					<tr>
						<td>${su.subject.subject_name }</td>
						<td><c:choose>
								<c:when test="${su.subject.yoil  == 1}">월</c:when>
								<c:when test="${su.subject.yoil  == 2}">화</c:when>
								<c:when test="${su.subject.yoil  == 3}">수</c:when>
								<c:when test="${su.subject.yoil  == 4}">목</c:when>
								<c:otherwise>금</c:otherwise>
							</c:choose></td>

						<td>${su.subject.start_time }</td>
						<td>${su.subject.end_time }</td>
						<td>${su.subject.professor.professor_name }</td>
						<td><c:choose>
								<c:when test="${su.re_attend  == 0}">X</c:when>
								<c:otherwise>O</c:otherwise>
							</c:choose></td>
						<td><button class="form-control btn btn-primary"
								type="button"
								onclick='javascript:deleteSugang(${su.attend_code})'>수강취소</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
function deleteSugang(attend_code) {
	if(!confirm("이 과목을 수강 취소하시겠습니까?")){
		return false;
	}
	$.ajax({
		type : "delete",
		url : "deleteSugang/"+attend_code
	}).done(function(resp){
		if(resp == "success"){
			alert("과목이 취소되었습니다.")
			location.reload();
		}
	}).fail(function(e){
		alert("취소에 실패하셨습니다.")
	})
}
</script>
</html>