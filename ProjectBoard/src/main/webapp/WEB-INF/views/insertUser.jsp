<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 회원가입시 입력정보 에러처리 -->
<script type="text/javascript">
function formSubmit(){
	if(document.insertForm.userId.value == ""){
		alert("아이디를 입력해주세요");
		return false;
	}
	else if(document.insertForm.password.value == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	else if(document.insertForm.name.value == ""){
		alert("이름을 입력해주세요");
		return false;
	}
	else if(document.insertForm.role.value == ""){
		alert("직책을 입력해주세요");
		return false;
	}
	else{
		return true;
	}
}
</script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="/resources/jquery-3.5.1.min.js"></script>
</head>
<body>
<center>
<h1>회원가입하기</h1>
</center>
<hr><br><br>
<div class="container">
<form name="insertForm" onSubmit="return formSubmit();" action="insertUser.do" method="post">
<div class="row">
		<div class="from-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-4" >
				<label for="userId">아이디</label><br>
			</div>
			<div class="col-md-3" >
				<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력하세요." />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="from-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-4" >
				<label for="password">비밀번호</label><br>
			</div>
			<div class="col-md-3" >
				<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요." /> 
			</div>
		</div>
	</div>
	<div class="row">
		<div class="from-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-4" >
				<label for="name">이름</label><br>
			</div>
			<div class="col-md-3" >
				<input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요." /> 
			</div>
		</div>
	</div>
	<div class="row">
		<div class="from-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-4" >
				<label for="name">직책</label><br>
			</div>
			<div class="col-md-3" >
				<input type="text" class="form-control" name="role" id="role" placeholder="직책을입력하세요." /> 
			</div>
		</div>
	</div>
	<br>
	<div align="center">
		<button type="submit" class="btn btn-default">제출</button>
	</div>
</form>
</div>
</body>
</html>