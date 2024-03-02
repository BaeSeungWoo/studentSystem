<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<section class="py-5">
	<input type="hidden" id="student_code" name="student_code"
		value="${p.student.student_code}" />
	<div class="container">
		<h2>휴학</h2>
		<div>
			<label>휴학 종류</label>&nbsp;&nbsp;<select name="academic_status"
				id="academic_status">
				<option value="military_hyuhak">군 휴학</option>
				<option value="normal_hyuhak">일반 휴학</option>
			</select>
		</div>
		<br />
		<div class="row justify-content-end">
			<div class="col-10"></div>
			<div class="col">
				<input class="form-control btn btn-primary" type="submit"
					id="hyuhakBtn" name="hyuhakBtn" value="휴학하기"></input>
			</div>
		</div>
	</div>
</section>
<script>
	$("#hyuhakBtn").click(function() {
		if (!confirm("휴학 신청 하시겠습니까?")) {
			return false;
		} else {
			data = {
					student_code : $("#student_code").val(),
					academic_status : $("#academic_status").val()
			}
			$.ajax({
				type : "put",
				url : "/student/hyuhak",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data)
			}).done(function(resp){
				if(resp == "success"){
					alert("휴학 신청이 완료되었습니다.")
					location.href = "/"
				}
			}).fail(function(e){
				alert("휴학 신청에 오류가 발생하였습니다.")
			})
		}

	})
</script>
<%@include file="../include/footer.jsp"%>