<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section class="py-5">
	<div class="container">
		<h2>학생 성적 입력 페이지</h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>이름</th>
					<th>과목명</th>
					<th>중간점수</th>
					<th>기말점수</th>
					<th>최종점수</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${studentList }" var="st" varStatus="status">
					<tr>
						<td>${st.student.name }</td>
						<td>${st.subject.subject_name }</td>
						<td>${st.mid_score }</td>
						<td>${st.last_score }</td>
						<td>${st.final_score }</td>
						<td><button class="form-control btn btn-primary"
								type="button" onclick="javascript:insertScore(${st.attend_code})">성적 입력</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
<script>
function insertScore(attend_code) {
	if(!confirm("성적을 입력하시겠습니까")){
		return false;
	}
	window.open("/professor/insertScore/"+attend_code, "", "width=700 height=400")
}
</script>
<%@ include file="../include/footer.jsp"%>