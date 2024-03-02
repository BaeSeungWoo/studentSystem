<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<section class="py-5">
		<div class="container">
			<input type="hidden" id="attend_code" name="attend_code"
				value="${attend_code }" />
			<div>
				<label for="mid_score">중간고사 점수</label> <input class="form-control"
					type="text" id="mid_score" name="mid_score" onKeyup="scoreSum()">
			</div>
			<div>
				<label for="last_score">기말고사 점수</label> <input class="form-control"
					type="text" id="last_score" name="last_score" onKeyup="scoreSum()">
			</div>
			<div>
				<label for="final_score">최종학점</label> <input class="form-control"
					type="text" id="final_score" name="final_score" disabled>
			</div>
			<br />
			<div class="row justify-content-end">
				<div class="col-10"></div>
				<div class="col">
					<input class="form-control btn btn-primary" type="submit"
						id="insertBtn" value="입력"></input>
				</div>
			</div>
		</div>
	</section>
</body>
<script>
function scoreSum(){
	var total = '';
	var firstNum = 0;
	var secondNum = 0;
	
	firstNum = Number($("#mid_score").val());
	secondNum = Number($("#last_score").val());
	total = firstNum + secondNum ;
	if(total >= 180){
		$("#final_score").val("A+")
	} else if(total >= 160){
		$("#final_score").val("A")
	} else if(total >= 140){
		$("#final_score").val("B+")
	} else if(total >= 120){
		$("#final_score").val("B")
	} else if(total >= 100){
		$("#final_score").val("C+")
	} else if(total >= 80){
		$("#final_score").val("C")
	} else if(total >= 60){
		$("#final_score").val("D+")
	} else if(total >= 40){
		$("#final_score").val("D")
	} else {
		$("#final_score").val("F")
	} 
}

$("#insertBtn").click(function(){
	if(!confirm("성적을 입력하시겠습니까")){
		return false;
	}
	data = {
			attend_code : $("#attend_code").val(),
			mid_score : $("#mid_score").val(),
			last_score : $("#last_score").val(),
			final_score : $("#final_score").val()
	}
	$.ajax({
		type : "put",
		url : "/professor/insertDetailScore",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data)
	}).done(function(resp){
		if(resp == "success"){
			alert("성적이 입력되었습니다.");
			window.close();
		}
	})
})
	
</script>
</html>