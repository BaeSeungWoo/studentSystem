<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<section class="py-5">
	<div class="container">
		<h2>로그인</h2>
		<form action = "/login" method = "post">
		<div>
			<label for="username">아이디</label> <input class="form-control"
				type="text" id="username" name="username">
		</div>
		<br />
		<div>
			<label for="username">비밀번호</label> <input class="form-control"
				type="text" id="password" name="password">
		</div>
		<br />
		<div class="row justify-content-end">
			<div class="col-10"></div>
			<div class="col">
				<input class="form-control btn btn-primary" type="submit"
					id="LoginBtn" value="로그인"></input>
			</div>
		</div>
		</form>
	</div>
</section>
<%@include file="../include/footer.jsp"%>