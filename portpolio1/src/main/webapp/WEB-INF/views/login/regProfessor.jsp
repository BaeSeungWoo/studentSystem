<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<section class=py-5>
	<div class="container">
		<h2>교수 인증 페이지</h2>
		<div>
			<input class="form-control" type="text" id="professor_code"
				name="professor_code" placeholder="인증 코드를 입력해주세요">
		</div>
		<br/>
		<div class = "row justify-content-end">
		<div class="col-10"></div>
			<div class="col">
				<input class="form-control btn btn-primary" type="button"
					id="regBtn" value="인증하기"></input>
			</div>		
	</div>
	</div>
</section>
<script>
$("#regBtn").click(function(){
	$.ajax({
		type : "get",
		url : "/regProfessor/"+$("#professor_code").val()
	}).done(function(resp){
		if(resp == "success"){
			alert("교수 인증이 완료되었습니다.")
			location.href = "/logout"
		}
	})
})
</script>
<%@ include file="../include/footer.jsp"%>