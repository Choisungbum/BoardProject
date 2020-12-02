<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 날짜 포맷함수 변경 -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="/resources/jquery-3.5.1.min.js"></script>
<title>글 목록</title>
</head>
<body>
<center>
<h1>글 목록</h1>
<c:if test="${user.userId eq null }">
<div align="right">
<h5><a href="login.do">login</a>&nbsp<a href="insertUser.do">회원가입&nbsp</a></h5>
</div>
</c:if>

<c:if test="${user.userId ne null }">
<h3>${user.name }님 환영합니다</h3>
<div align="right">
<h4><a href="logout.do">log-out&nbsp</a></h4>
</div>
</c:if>
<hr>
<!-- 검색 시작 -->
<form action="getBoardList.do" method="post">
<table class="table" >
<tr>
	<td>
		<select name="searchCondition">
		<c:forEach items="${conditionMap}" var="option" >
			<option value="${option.value}">${option.key }
		</c:forEach>
		</select>
		<input type="text" name="searchKeyword" />
		<input type="submit" class="btn btn-info btn-xs" value="검색" />
	</td>
</tr>
</table>

<!-- 게시물 목록 -->
<table class="table table-hover" >
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>등록일</th>
	<th>조회수</th>
</tr>
<c:forEach items="${boardList }" var="board">
<tr>
	<td align="left">${board.seq }</td>
	<td align="left"><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
	<td>${board.writer }</td>
	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.regDate}" /></td>
	<td align="left">${board.cnt }</td>
</tr>
</c:forEach>
</table>
<br>
<br>
<!-- 페이징처리 -->
<div> 
	<c:if test="${pagination.curRange ne 1 }">
		<a href="getBoardList.do?curPage=1">[처음]</a>
	</c:if>
	<c:if test="${pagination.curPage ne 1 }">
		<a href="getBoardList.do?curPage=${pagination.prevPage}">[이전]</a>
	</c:if>
	<c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage }">
		<c:choose>
			<c:when test="${pageNum eq pagination.curPage }">
				<span style="font-weight: bold;"><a href="getBoardList.do?curPage=${pageNum }">${pageNum }</a></span>
			</c:when>
			<c:otherwise>
				<a href="getBoardList.do?curPage=${pageNum }">${pageNum }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0 }">
		<a href="getBoardList.do?curPage=${pagination.nextPage }">[다음]</a>
	</c:if>
	<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0 }">
		<a href="getBoardList.do?curPage=${pagination.pageCnt }">[끝]</a>
	</c:if>
</div>
<c:if test="${user.userId ne null }">
<br><a href="insertBoard.do">새글 등록</a>
</c:if>
</form>
<br>
	<div style="float:left">
                    총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
	</div>
</center>
</body>
</html>