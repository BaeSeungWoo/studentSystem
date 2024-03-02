<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 등록 페이지</title>
<link rel="icon" type="/image/x-icon" href="assets/favicon.ico">
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<form class="form-group" action="regPicture" method="post"
			enctype="multipart/form-data">
			<input class = "form-control" type="file" name="studentImage" placeholder="사진을 등록해주세요" />
			<br/>
			<div class="col-2">
				<button class="form-control btn btn-primary">보내기</button>
			</div>
		</form>
	</div>
</body>
<script>
	var msg = "${msg}";
	if(msg == "success"){
		window.close();
	}	
</script>
</html>