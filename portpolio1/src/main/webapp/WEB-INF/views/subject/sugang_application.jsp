<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section class="py-5">
	<div class="container">
		<input type="hidden" id="student_code" name="student_code"
			value="${p.student.student_code}" />
		<input type="hidden" id="department" name="department"
			value="${p.student.department}" />
		<h2>수강 신청</h2>
		<table id="printTable" class="table table-hover">
			<tr>
				<td>학년도 : <select id="year" name="year">
						<option selected="selected" value="2023">2023</option>
						<option value="2022">2022</option>
						<option value="2021">2021</option>
						<option value="2020">2020</option>
						<option value="2019">2019</option>
						<option value="2018">2018</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
				</select>
				</td>
				<td>학기 : <select id="term_code" name="term_code">
						<option selected="selected" value="1">1</option>
						<option value="2">2</option>
				</select></td>
				<td><button class="form-control btn btn-primary" type="button"
						onclick="SugangList()">신청목록</button></td>
			</tr>
			<tr>
				<td>대학 : <select id="major_type" name="major_type">
						<option selected="selected">대학을 선택해주세요</option>
						<option value="engineer">공과대</option>
						<option value="envirment">자연대</option>
						<option value="humanities">인문대</option>
						<option value="medicine">의대</option>
						<option value="law">법대</option>
				</select></td>
				<td>학부(과) : <select id="major_name" name="major_name">
						<option selected="selected">대학을 먼저 선택하세요</option>
				</select></td>
				<td></td>
			</tr>
			<tr>
				<td>이수구분 : <select id="subject_type" name="subject_type">
						<option selected="selected" value="0">전체</option>
						<option value="1">전공</option>
						<option value="2">교양</option>
				</select></td>
				<td>과목명 : <input type="text" id="subject_name"
					name="subject_name" placeholder="과목명을 입력해주세요." />
				</td>
				<td><button class="form-control btn btn-primary" type="button"
						id="subjectSearch">검색</button></td>
			</tr>
		</table>
		<table id="subjectPrintTable" class="table table-hover">
			<thead>
				<tr>
					<th>과목명</th>
					<th>학점</th>
					<th>과목종류</th>
					<th>담당교수</th>
					<th>요일</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="SearchResultSubject">
			</tbody>
		</table>
	</div>
</section>
<script>
function SugangList() {
	window.open("/student/sugangList","","width=700 height=400")
}

function addSubject(subject_code) {
	
	if(!confirm("이 과목을 추가하시겠습니까?")){
		return false;
	}
	data = {
			year : $("#year").val(),
			term_code : $("#term_code").val()
	}
	$.ajax({
		type : "post",
		url : "/student/addSubject/"+subject_code,
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data)
	}).done(function(resp){
		console.log(resp)
		if(resp == "success"){
			alert("과목이 추가되었습니다.")
		} else if(resp == "alert"){
			alert("다른 학과의 과목은 추가가 불가능합니다.")
		} else if(resp == "fail") {
			alert("동시간대의 과목은 추가가 불가능합니다.")
		}
	}).fail(function(e){
		alert("추가에 실패하였습니다.")
	})
}
	$("#major_type").on('change',function() {
						var major_list;
						$.ajax({
											type : "get",
											url : "/getMajorList/"+ $("#major_type").val()
										}).done(function(resp) {
											if (resp.length == 0) {
												major_list = '<option selected="selected">대학을 먼저 선택하세요</option>'
											}
											$.each(resp,function(key, val) {
																major_list += '<option value='+val.major_code+'>'
																		+ val.major_name
																		+ '</option>'
															})
											$("#major_name").html(major_list)
										})
					})
	$("#subjectSearch").click(function() {
						var subject_list;
						$.ajax({
											type : "get",
											url : "/student/getSubjectList/"+ $("#subject_type").val()+ "/"+ $("#major_name").val()
										}).done(function(resp) {
											$.each(resp,function(key, val) {
																subject_list += "<tr>"
																subject_list += "<td>"
																		+ val.subject_name
																		+ "</td>"
																subject_list += "<td>"
																		+ val.credits_earned
																		+ "</td>"
																if (val.subject_type == 1) {
																	subject_list += "<td>전공</td>"
																} else {
																	subject_list += "<td>교양</td>"
																}
																subject_list += "<td>"
																		+ val.professor.professor_name
																		+ "</td>"
																if(val.yoil == 1) {
																	subject_list += "<td>월</td>"	
																} else if(val.yoil == 2) {
																	subject_list += "<td>화</td>"
																} else if(val.yoil == 3) {
																	subject_list += "<td>수</td>"
																} else if(val.yoil == 4) {
																	subject_list += "<td>목</td>"
																} else if(val.yoil == 5) {
																	subject_list += "<td>금</td>"
																}					
																	
																subject_list += "<td>"
																		+ val.start_time
																		+ "</td>"
																subject_list += "<td>"
																		+ val.end_time
																		+ "</td>"
																subject_list += "<td><a href = 'javascript:addSubject("+val.subject_code+")'>추가</a></td>"
																subject_list += "</tr>"
															})
											$("#SearchResultSubject").html(
													subject_list);
										})
					})
</script>
<%@ include file="../include/footer.jsp"%>