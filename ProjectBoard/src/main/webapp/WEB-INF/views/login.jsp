<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="/resources/jquery-3.5.1.min.js"></script>
<!-- 로그인시 입력부분 에러처리 -->
<script type="text/javascript">
function formSubmit(){
	if(document.loginForm.userId.value == ""){
		alert("아이디을 입력해주세요");
		return false;
	}
	else if(document.loginForm.password.value == ""){
		alert("비밀번호을 입력해주세요");
		return false;
	}
	else{
		return true;
	}
}
</script>
</head>
<body>
<center>
<h1>로그인 </h1>
<hr>
<br><br>
<div class="container">
<form name="loginForm" onSubmit="return formSubmit();" action="login.do" method="post">
	<div class="row">
		<div class="form-group" style="line-height:40px" >
			<div class="col-md-1 col-md-offset-4" >
				<label for="userId">아이디</label><br>
			</div>
			<div class="col-md-3" >
				<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력하세요">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group" style="line-height:40px" >
			<div class="col-md-1 col-md-offset-4" >
				<label for="password">비밀번호</label><br>
			</div>
			<div class="col-md-3" >
				<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요">
			</div>
		</div>
	</div>
	<br>
		<button type="submit" class="btn btn-default">제출</button>
</form>
<br>
	<a href="insertUser.do">회원가입하기</a>
</div>
</center>
</body>
</html>