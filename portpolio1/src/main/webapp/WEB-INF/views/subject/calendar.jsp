<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<section class="py-5">
	<div class="container">
		<h2>강의 시간표</h2>
		<table class="table table-bordered" border='1'>
			<thead>
				<tr>
					<th>강의명</th>
					<th>요일</th>
					<th>강의 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${calendar}" var="su" varStatus="status">
					<tr>
						<td>${su.subject.subject_name }</td>
						<td><c:choose>
								<c:when test="${su.subject.yoil  == 1}">월</c:when>
								<c:when test="${su.subject.yoil  == 2}">화</c:when>
								<c:when test="${su.subject.yoil  == 3}">수</c:when>
								<c:when test="${su.subject.yoil  == 4}">목</c:when>
								<c:otherwise>금</c:otherwise>
							</c:choose></td>
						<td>${su.subject.start_time }~${su.subject.end_time }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
<%@ include file="../include/footer.jsp"%>