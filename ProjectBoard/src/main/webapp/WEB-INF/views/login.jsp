<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<jsp:include page="/WEB-INF/views/ref.jsp"></jsp:include>
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
	
	return true;
	
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
<input type="hidden" name="errorsId" id="errorsId" value="${errors.id}" />				<!-- errors맵 값을 jquery로 값을 넘겨주기위함  -->
<input type="hidden" name="errorsPass" id="errorsPass" value="${errors.pass}" />
	<div class="row">
		<div class="form-group" style="line-height:40px" >
			<div class="col-md-1 col-md-offset-4" >
				<label for="userId">아이디</label><br>
			</div>
			<div class="col-md-3" >
				<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력하세요">
				<c:if test="${errors.id}"><span style="color:red">아이디가 존재하지 않습니다 </span></c:if>
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
				<c:if test="${errors.pass}"><span style="color:red">비밀번호가 틀렸습니다</span></c:if>
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