<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 날짜 포맷함수 변경 -->
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세</title>
<jsp:include page="/WEB-INF/views/ref.jsp"></jsp:include>
<!-- json형식으로 값을 넘기는거에서 많이 힘ㄷ르었음 json형식 잘봐두기 content필수=>json.stringify사용(안의내용을 json형식으로 바꿔줌)-->
<script>

	
</script>
</head>
<body>

<center>
<h1>글 상세</h1>
</center>
<br>
<hr>
<form action="updateBoard.do" method="post">
<input name="seq" type="hidden" value="${board.seq}" />
<input type="hidden" name="userid" id="userid" value="${user.userId}" /> <!-- 자바스크립트로 userid 값을 보내기위한 구문-->
	<div class="row" >
		<div class="form-group" style="line-height:40px"> <!-- 글쓴이와 세션아이디가 같을경우 수정가능  -->
			<div class="col-md-1" >
				<label for="title">제목</label>
			</div>
			<div class="col-md-10">	
				<input type="text" class="form-control" name="title" id="title" value="${board.title}" />
			</div>
		</div>
	</div>
	<div class="row" >
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1" >
				<label>작성자</label>
			</div>
			<div class="col-md-10">		
				${board.writer}
			</div>
		</div>
	</div>
	<div class="row" >
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1" >	
				<label for="content">내용</label>
			</div>
			<div class="col-md-10">					
				<textarea class="form-control" name="content" id="content" rows="20">${board.content }</textarea>
			</div>
		</div>
	</div>
	<div class="row" >
		<div class="form-group" style="line-height:40px" >
			<div class="col-md-1" >
				<label>등록일</label>
			</div>
			<div class="col-md-10" >
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.regDate}" />
			</div>
		</div>
	</div>
	<div class="row" >
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1" >	
				<label>조회수</label>
			</div>
			<div class="col-md-10" >
				${board.cnt}
			</div>
		</div>
	</div>
	
	<div align="center">
		<button type="submit" class="btn btn-default">수정</td>
	</div>
</form>
</body>
</html>