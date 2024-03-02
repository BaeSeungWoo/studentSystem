<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
  <style>
    /* 숫자 입력 필드의 화살표 버튼 숨김 */
    input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }

    /* Firefox에서 숫자 입력 필드의 화살표 버튼 숨김 */
    input[type="number"] {
      -moz-appearance: textfield;
    }
  </style>
<section class="py-5">
<input type = "hidden" name = "student_code" id = "student_code" value = "${p.student.student_code}"/>
	<div class="container">
		<h2>등록금 납입</h2>
		<div>
			<label>은행 : </label> <select name="bank" id="bank">
				<option value="nonghyup">농협</option>
				<option value="woori">우리</option>
				<option value="busan">부산</option>
				<option value="toss">토스</option>
				<option value="kakao">카카오페이</option>
			</select>
		</div>
		<br />
		<div>
			<label for="password">계좌번호</label> <input class="form-control"
				type="number" id="account" name="account" placeholder = "-를 제외하고 입력해주세오">
		</div>
		<br />
		<div class="col-3">
			<input class="form-control btn btn-primary" type="submit"
				id="FeeBtn" value="등록금 납부"></input>
		</div>
	</div>
</section>
<script>
$("#FeeBtn").click(function(){
	if(!confirm("금액은 3,800,760원입니다. 납부하시겠습니까?")){
		return false;
	} else {
		data = {
				bank : $("#bank").val(),
				account : $("#account").val()
		}
		$.ajax({
			type : "post",
			url : "/student/fee/"+$("#student_code").val(),
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data)
		}).done(function(resp){
			if(resp == "success"){
				alert("등록금이 정상적으로 납부되었습니다.")
				location.href = "/"
			}
		}).fail(function(e){
			alert("등록금 납부에 실패하셨습니다.")
		})
	}
})
</script>
<%@ include file="../include/footer.jsp"%>