<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/ref.jsp"></jsp:include>
<title>로그인한 화면</title>
</head>
<body>
<center>
<h1>${user.name}님 환영합니다</h1>
<div align="right" style="position:relative;right:10px" >
<h5><button type="button" class="btn btn-link" onclick="location.href='logout.do'">logout</button></a></h5>
</div>
<hr>
<br><br><br>
 <div class="center-block" style="max-width: 400px;">
<a href="updateUser.do" class="btn btn-success btn-block" role="button">회원정보 수정</a><br><br><br>
<a href="deleteUser.do" class="btn btn-danger btn-block" role="button">회원탈퇴</a><br><br><br>
</div>
</center>
</body>
</html>
