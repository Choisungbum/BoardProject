<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="/resources/jquery-3.5.1.min.js"></script>
<title>로그인한 화면</title>
</head>
<body>
<center>
<h1>${user.name}님 환영합니다</h1>
<div align="right">
<h4><a href="logout.do">log-out&nbsp;</a></h4>
</div>
<hr>
<br><br><br>
회원탈퇴하기
<a href="deleteUser.do">회원탈퇴</a><br><br><br>
회원정보 수정하기
<a href="updateUser.do">회원정보 수정</a><br><br><br>
게시물 목록 보기
<a href="getBoardList.do">게시물 목록 보기</a><br><br><br>
</center>
</body>
</html>
