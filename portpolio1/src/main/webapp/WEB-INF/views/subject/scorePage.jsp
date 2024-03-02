<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section>
	<br />
	<div class="container">
		<h2>성적확인 페이지</h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>과목명</th>
					<th>학점</th>
					<th>중간고사점수</th>
					<th>기말고사점수</th>
					<th>최종학점</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sugangList}" var="su" varStatus="status">
					<tr>
						<td>${su.subject.subject_name }</td>
						<td>${su.subject.credits_earned }</td>					
						<td>${su.mid_score}</td>
						<td>${su.last_score}</td>
						<td>${su.final_score}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br/>
</section>

<%@ include file="../include/footer.jsp"%>

