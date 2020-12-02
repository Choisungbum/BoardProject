<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 게시물작성시 입력부분 에러처리 -->
<script type="text/javascript">
function formSubmit(){
	if(document.boardForm.title.value == ""){
		alert("제목을 입력해주세요");
		return false;
	}
	else if(document.boardForm.content.value == ""){
		alert("내용을 입력해주세요");
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
<meta charset="UTF-8">
<title>새글 등록</title>
</head>
<body>

<center>
<h1>새글등록</h1>

<div align="right">
<h5><a href="logout.do">log-out&nbsp;</a></h5>
</div>
<hr>
<form name="boardForm" onSubmit="return formSubmit();" action="insertBoard.do" method="post">
<input type="hidden" name="writer" value="${user.userId}">
	<div class="row">
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1" >
				<label for="title">제목</label>
			</div>
			<div class="col-md-10" >
				<input type="text" class="form-control" name="title" id="title" />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group" style="line-height:40px"><!-- disabled 속성을 통해 id변경불가-->
			<div class="col-md-1" >
				<label for="writer">작성자</label>
			</div>
			<div class="col-md-10" >
				<input type="text" class="form-control" name="writer" id="writer"  value="${user.userId }" placeholder=${user.userId } disabled />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group" style="line-height:40px" >
			<div class="col-md-1" >
				<label for="content">내용</label>
			</div>
			<div class="col-md-10" >	
				<textarea class="form-control" name="content" id="content" rows="20" ></textarea>
			</div>
		</div>
	</div>
	<br><br>
	<button type="submit" class="btn btn-default">등록</button>
</form>
<hr>
<a href="getBoardList.do">글목록 가기</a><br>
</center>
<br><br>
</body>
</html>