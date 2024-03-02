<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>학생정보시스템</title>
<!-- Favicon-->
<link rel="icon" type="/image/x-icon" href="assets/favicon.ico">
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/">학생정보시스템</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<sec:authentication property="principal" var="p" />
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/">홈</a></li>
					<sec:authorize access="isAnonymous()">
						<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="/SignUp">회원가입</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_STUDENT')">
						<li class="nav-item"><a class="nav-link">${p.student.name}님
								반갑습니다</a></li>
						<li class="nav-item"><a class="nav-link" href = "/regProfessor">교수 인증하기</a></li>						
						<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_PROFESSOR')">
						<li class="nav-item"><a class="nav-link">${p.student.name}교수님
								반갑습니다</a></li>						
						<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="/professor/insertScore">성적입력</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">
					학생정보시스템에<br />오신것을 환영합니다
				</h1>
			</div>
		</div>
	</header>