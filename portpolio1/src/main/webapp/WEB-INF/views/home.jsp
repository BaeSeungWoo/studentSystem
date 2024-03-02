<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<section class="py-5">
	<div class="container px-4 px-lg-5">
		<div class="nav-item dropdown px-4">
			<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">학적</a>
			<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="/student/detail">학적부 조회</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="/student/hyuhak">휴학 신청</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="/student/bokhak">복학 신청</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="/student/fee">등록금 납입</a></li>
			</ul>
			<br/>
			<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">수강</a>
			<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="/student/sugang_application">수강신청 및 정정</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="/student/calendar">개인 강의 시간표</a></li>
			</ul>
			<br/>
			<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false">성적</a>
			<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="/student/score">성적조회</a></li>
			</ul>
		</div>
	</div>
</section>
<%@include file="include/footer.jsp"%>