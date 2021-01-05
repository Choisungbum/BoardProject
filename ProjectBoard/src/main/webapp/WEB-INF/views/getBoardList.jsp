<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 날짜 포맷함수 변경 -->
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/ref.jsp"></jsp:include>
<title>글 목록</title>
</head>
<body>
<center>
<h1>글 목록</h1>
<c:if test="${user.userId eq null }">
<div align="right" style="position:relative;right:10px">
<h5><button type="button" class="btn btn-link" onclick="location.href='login.do'">로그인</button>
<button type="button" class="btn btn-link" onclick="location.href='insertUser.do'">회원가입</button></h5>
</div>
</c:if>

<c:if test="${user.userId ne null }">
<h3>${user.name }님 환영합니다</h3>
<div align="right" style="position:relative;right:10px" >
<h5><button type="button" class="btn btn-link" onclick="location.href='logout.do'">logout</button>
<button type="button" class="btn btn-link" onclick="location.href='userMgm.do'">회원관리</button></h5>
</div>
</c:if>
<hr>

<!-- 검색 시작 -->
<form action="getBoardList.do" method="post">  <!-- 부트스트랩적용하기  style="position:relative" -->
<div class="row" style="display:flex; flex-direction:row;position:relative;left:20px">
		<select name="searchCondition"  >
		<c:forEach items="${conditionMap}" var="option" >
			<option value="${option.value}">${option.key }
		</c:forEach>
		</select>
		<input type="text"  name="searchKeyword" />
		<input type="submit" class="btn btn-info btn-xs" value="검색" />
</div>
</form>
<br>
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

<button type="button" class="btn btn-primary" onclick="location.href='insertBoard.do'">새글등록</button>
<br><br><br>
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

<!-- 
<c:if test="${user.userId ne null }">

</c:if> -->
<br><br>
</center>
</body>
</html>