<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="/resources/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>회원 정보수정</title>
</head>
<body>
<center>
<h1>회원 정보수정</h1>
</center>
<hr>
<br><br>
<div class="container">
<form action="updateUser.do" method="post">
	<div class="row">
		<div class="from-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-4" >
				<label for="userId">아이디</label><br>
			</div>
			<div class="col-md-3" >
				<input type="text" class="form-control" name="userId" id="userId" value="${user.userId }" />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="from-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-4" >
				<label for="password">비밀번호</label><br>
			</div>
			<div class="col-md-3" >
				<input type="password" class="form-control" name="password" id="password" value="${user.password }" /> 
			</div>
		</div>
	</div>
	<div class="row">
		<div class="from-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-4" >
				<label for="name">이름</label><br>
			</div>
			<div class="col-md-3" >
				<input type="text" class="form-control" name="name" id="name" value="${user.name }" /> 
			</div>
		</div>
	</div>
	<div class="row">
		<div class="from-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-4" >
				<label for="name">직책</label><br>
			</div>
			<div class="col-md-3" >
				<input type="text" class="form-control" name="role" id="role" value="${user.role }" /> 
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