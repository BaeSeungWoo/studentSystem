<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<section class="py-5">
	<div class="container">
		<h2>회원가입</h2>
		<div>
			<label for="username">아이디</label> <input class="form-control"
				type="text" id="username" name="username">
		</div>
		<br />
		<div>
			<label for="password">비밀번호</label> <input class="form-control"
				type="text" id="password" name="password">
		</div>
		<br />
		<div>
			<label for="passwordCheck">비밀번호 확인</label> <input
				class="form-control" type="text" id="passwordCheck"
				name="passwordCheck">
		</div>
		<br />
		<div>
			<label for="email">이메일</label> <input class="form-control"
				type="text" id="email" name="email">
		</div>
		<br />
		<div>
			<label for="name">이름</label> <input class="form-control" type="text"
				id="name" name="name">
		</div>
		<br />
		<div>
			<label for="birth">생년월일</label> <input class="form-control"
				type="date" id="birth" name="birth" max="2077-06-20" min="1900-01-01" value = "2000-01-01">
		</div>
		<br />
		<div>
			<label for="phone">휴대전화</label> <input class="form-control"
				type="text" id="phone" name="phone">
		</div>
		<br />
		
		<br />
		<div>
			<label>주소</label>
			<div class="row">
				<div class="col">
					<input class="form-control" type="text" id="zipcode" name="zipcode"
						placeholder="우편번호" readonly="readonly">
				</div>
				<div class="col-2">
					<input class="form-control btn btn-primary" type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호">
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col">
					<input class="form-control" type="text" id="address1"
						name="address1" placeholder="도로명주소" readonly="readonly">
				</div>
				<div class="col" style="display: none;">
					<span class="form-control" id="guide"
						style="color: #999; display: none"></span>
				</div>
				<div class="col">
					<input class="form-control" type="text" id="address2"
						name="address2" placeholder="상세주소">
				</div>
			</div>
		</div>
		<br />
		<div>
			<label>성별</label> 남 : <input type="radio" name="gender" value="man" />
			여 : <input type="radio" name="gender" value="woman" /><br />
		</div>
		<br/>
		<div>
			<label>주,야간</label> 주 : <input type="radio" name="juya" value="ju" />
			야 : <input type="radio" name="juya" value="ya" /><br />
		</div>
		<br/>
		<div>
			<label>대학 : </label><select id="major_type" name="major_type">
						<option selected="selected">대학을 선택해주세요</option>
						<option value="engineer">공과대</option>
						<option value="envirment">자연대</option>
						<option value="humanities">인문대</option>
						<option value="medicine">의대</option>
						<option value="law">법대</option>
				</select>
				학부(과) : <select id="department" name="department">
						<option selected="selected">대학을 먼저 선택하세요</option>
				</select>
		</div>
		<br />
		<div class="col">
			<input class="form-control btn btn-primary" type="submit"
				id="SignUpBtn" value="회원가입"></input>
		</div>
	</div>
</section>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("address1").value = roadAddr;

				var guideTextBox = document.getElementById("guide");
				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if (data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr
							+ ')';
					guideTextBox.style.display = 'block';
					guideTextBox.parentNode.style.display = 'block';

				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr
							+ ')';
					guideTextBox.style.display = 'block';
					guideTextBox.parentNode.style.display = 'block';
				} else {
					guideTextBox.innerHTML = '';
					guideTextBox.style.display = 'none';
					guideTextBox.parentNode.style.display = 'none';
				}
			}
		}).open();
	}
	
	$("#major_type")
	.on(
			'change',
			function() {
				var major_list;
				$
						.ajax(
								{
									type : "get",
									url : "/getMajorList/"
											+ $("#major_type").val()
								})
						.done(
								function(resp) {
									if (resp.length == 0) {
										major_list = '<option selected="selected">대학을 먼저 선택하세요</option>'
									}
									$
											.each(
													resp,
													function(key, val) {
														major_list += '<option value='+val.major_code+' >'
																+ val.major_name
																+ '</option>'
													})
									$("#department").html(major_list)
								})
			})

	$("#SignUpBtn").click(function() {
		if ($("#username").val() == "") {
			alert("아이디를 입력해주세요.")
			return false;
		} else if ($("#password").val() == "") {
			alert("비밀번호를 입력해주세요.")
			return false;
		} else if ($("#passwordCheck").val() == "") {
			alert("비밀번호 확인란을 입력해주세요.")
			return false;
		} else if ($("#password").val() != $("#passwordCheck").val()) {
			alert("비밀번호가 같지 않습니다.")
			return false;
		} else if ($("#email").val() == "") {
			alert("이메일을 입력해주세요.")
			return false;
		} else if ($("#name").val() == "") {
			alert("이름을 입력해주세요.")
			return false;
		} else if ($("#birth").val() == "") {
			alert("생년월일을 입력해주세요.")
			return false;
		} else if ($("#phone").val() == "") {
			alert("휴대전화 번호를 입력해주세요.")
			return false;
		} else if ($("#zipcode").val() == "") {
			alert("우편번호를 선택하세요.")
			return false;
		} else if ($("#address2").val() == "") {
			alert("상세주소를 입력해주세요.")
			return false;
		} else if ($("#gender").val() == "") {
			alert("성별을 선택해주세요.")
			return false;
		} else if ($("#juya").val() == "") {
			alert("주,야간을 선택해주세요.")
			return false;
		} 
		addr = {
			zipcode : $("#zipcode").val(),
			address1 : $("#address1").val(),
			address2 : $("#address2").val()
		}		
		data = {
			phone : $("#phone").val(),
			birth : $("#birth").val(),
			email : $("#email").val(),
			name : $("#name").val(),
			password : $("#password").val(),
			username : $("#username").val(),
			gender : $("input[name=gender]:radio:checked").val(),
			juya : $("input[name=juya]:radio:checked").val(),
			address : addr,
			department : $("#department").val(),
		}
		$.ajax({
			type : "post",
			url : "/SignUp",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data)
		}).done(function(resp) {
			console.log(resp)
			if (resp == "success") {
				location.href = "/"
			} else {
				alert("아이디 중복")
			}
		}).fail(function(e) {
			alert("error" + e)
		})
	})
</script>
<%@include file="../include/footer.jsp"%>
