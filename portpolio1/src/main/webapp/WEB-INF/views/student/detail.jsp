<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="/css/detail.css" rel="stylesheet">
<section>
	<br />
	<div class="container">
		<table>
			<tr align="center" height="5" bgcolor="#DBE9BF">
				<td id="studentImage" colspan="5" rowspan="4" bgcolor="#DCDCDC"><c:choose>
						<c:when test="${not empty p.student.picture.pictureName }">
							<!--<img alt="사진" src="/studentImage2/${picture}" />  -->
							<a onclick="regPicture()">사진 등록</a>
						</c:when>
						<c:otherwise>
							<a onclick="regPicture()">사진 등록</a>
						</c:otherwise>
					</c:choose></td>
				<td align="center" colspan="3" bgcolor="#DCDCDC"><b>학적정보</b></td>
			</tr>
			<tr align="center" height="5" bgcolor="#DBE9BF">
				<td colspan="2" bgcolor="#DCDCDC">성 명</td>
				<td colspan="1" width="40%" bgcolor="#DCDCDC">학번</td>
			</tr>
			<tr align="center" height="25" bgcolor="#DBE9BF">
				<td colspan="2">${p.student.name}</td>
				<td colspan="1">${p.student.student_code}</td>
			</tr>
			<tr align="center" height="5" bgcolor="#DBE9BF">
				<td bgcolor="#DCDCDC">생년월일</td>
				<td colspan="2">${p.student.birth}</td>
			</tr>
			<tr align="center" height="5" bgcolor="#DBE9BF">
				<td colspan="5" bgcolor="#DCDCDC">주소</td>
				<td colspan="3">${p.student.address.address1},
					${p.student.address.address2}</td>
			</tr>
			<tr align="center" height="5" bgcolor="#DBE9BF">
				<td colspan="5" bgcolor="#DCDCDC">전화번호</td>
				<td colspan="3">${p.student.phone}</td>
			</tr>
			<tr align="center" height="5" bgcolor="#DBE9BF">
				<td colspan="5" bgcolor="#DCDCDC">학과</td>
				<td width="15%">${p.student.department}</td>
				<td width="15%" bgcolor="#DCDCDC">학년</td>
				<td width="15%">${p.student.grade}</td>
			</tr>
			<tr align="center" height="5" bgcolor="#DBE9BF">
				<td colspan="5" rowspan="2" bgcolor="#DCDCDC">휴학 여부</td>
				<td width="15%" rowspan="2">${p.student.academic_status}</td>
				<td width="15%" bgcolor="#DCDCDC">주,야간</td>
				<td width="15%">${p.student.juya}</td>
			</tr>
		</table>
		<br /> <input class="form-control btn btn-primary" type="submit"
			id="UpdateBtn" value="수정"></input> <br /><br /> 
	</div>
</section>
<script>
	$("#UpdateBtn").click(function() {
		location.href = "/student/update"
	})

	function regPicture() {
		window.open("/student/picture", "", "width=700 height=400")
	}
</script>
<%@ include file="../include/footer.jsp"%>