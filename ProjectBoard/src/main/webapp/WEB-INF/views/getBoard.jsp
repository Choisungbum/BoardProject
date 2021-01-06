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
$(document).ready(function(){
	replyList(); //댓글목록
	 
	$("#btninsertReply").click(function(){ 				//댓글 입력 
		var replytext=$('textarea#replytext').val();
	if(replytext == ""){								//댓글창이 비어있을경우 등록 X
		alert("댓글을 입력해 주세요");
		return 0;
	}
		var bno=${board.seq};
		var replyer="${user.userId}";
	$.ajax({
		type: "post",
		url: "/insertReply.do",
		contentType: 'application/json',
		data: JSON.stringify({
			'bno' : bno,
			'replytext' : replytext,
			'replyer' : replyer
		}),
		success: function(){
			alert("댓글이 등록되었습니다.");
			replyList();
			},
		error: function(){
			alert("에러발생");
			}
		
		}); 	
	});
	
	
	
});
	
	
	function revise(rno){ 
	var rno = rno;
	$("#updateForm"+rno).html("<textarea class=\"form-control\" rows=\"5\" id=\"ureplytext\" placeholder=\"\"></textarea><br>"
			+"<button type=\"button\" class=\"btn btn-warning btn-xs\" id=\"btnupdateReply\" onclick='updateReply("+rno+")'>수정</button>");
	
	}
	
	function updateReply(rno){//			댓글수정
		var rno = rno;
		var bno = ${board.seq};
		var replytext = $("textarea#ureplytext").val();
		$.ajax({
			type: "post",
			url: "/updateReply.do",
			contentType: 'application/json',
			data: JSON.stringify({
				'bno' : bno,
				'rno' : rno,
				'replytext' : replytext
			}),
			success: function(){
				alert("댓글이  수정되었습니다.");
				replyList();
				},
			error: function(){
				alert("에러발생");
				}
			
			});	
	}
	
	function deleteReply(rno){			  //댓글삭제
		var rno = rno;
		var bno=${board.seq};
	$.ajax({
		type: "post",
		url: "/deleteReply.do",
		contentType: 'application/json',
		data: JSON.stringify({
			'bno' : bno,
			'rno' : rno
		}),
		success: function(){
			alert("댓글이 삭제되었습니다.");
			replyList();
			},
		error: function(){
			alert("에러발생");
			}
		
		});	
	}		
	
	function replyList(){ 					//댓글목록
		
		var userid = document.getElementById("userid").value; 
		
		$.ajax({
			type:"get",
			url:"/getReplyList.do?bno=${board.seq}",
			success: function(result){
				console.log(result);
				var output = "<hr>";
				for(var i in result){
					if(result[i].replyer == userid){
						output += "<div>";
						output += result[i].replyer;
						output += "("+changeDate(result[i].regDate)+")&nbsp";
						output += "<button type=\"button\" class=\"btn btn-info btn-xs\"id=\"btnupdate\" onclick='revise("+result[i].rno+")'>수정</button>&nbsp";
						output += "<button type=\"button\" class=\"btn btn-danger btn-xs\" id=\"btndeleteReply\" onclick='deleteReply("+result[i].rno+")'>삭제</button>";
						output += "</div><br>";
						output += "<div id=updateForm"+result[i].rno+">";
						output += result[i].replytext;
						output += "</div><hr>";
					}
					else{
						output += "<div>";
						output += result[i].replyer;
						output += "("+changeDate(result[i].regDate)+")";
						output += "</div><br>";
						output += "<div id=updateForm"+result[i].rno+">";
						output += result[i].replytext;
						output += "</div><hr>";
					}
				}   
				$("#replyList").html(output);
			}
		});
	}
	function changeDate(date){
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = (date.getMonth()+1);
		day = (date.getDate());
		hour = (date.getHours());
		minute = date.getMinutes();
		second = date.getSeconds();
		//2자리수로 만들기
		month < 10 ? month = '0' + month : month;
		day < 10 ? day = '0' + day : day;
		hour < 10 ? hour = '0' + hour : hour;
		minute < 10 ? minute = '0' + minute : minute;
		second < 10 ? second = '0' + second : second;
		strDate = year+"-"+month+"-"+day+ " "+hour+":"+minute+":"+second;
		return strDate;
	}
	
	$("#delBoard").click(function(){
		var writer = ${board.writer};
		console.log(writer);
		var user = ${user.userId};
		console.log(user);
		if(!(writer).equals(user)){
			alert("작성자가 아닙니다");
			return false;
		}
			
	});
	
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
			<div class="col-md-1"  >
				<label >제목</label>
			</div>
			<div class="col-md-10">		
				${board.title}
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
				<label>내용</label>
			</div>
			<div class="col-md-10" >
				${board.content}
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
</form>
<center>

<c:choose>
	<c:when test="${user.userId eq null || user.userId eq board.writer}">
		<a href="insertBoard.do" class="btn btn-link btn-sm">글 등록</a>&nbsp;&nbsp;&nbsp;
		<a href="updateBoard.do" class="btn btn-link btn-sm">글 수정</a>&nbsp;&nbsp;&nbsp;
		<a href="deleteBoard.do" class="btn btn-link btn-sm">글 삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="getBoardList.do" class="btn btn-link btn-sm">글목록</a>
	</c:when>
	<c:when test="${user.userId ne board.writer}">
		<a href="insertBoard.do">글 등록</a>&nbsp;&nbsp;&nbsp;
		<a href="getBoardList.do">글목록</a>
	</c:when>
	<c:otherwise>
		<a href="getBoardList.do">글목록</a>
	</c:otherwise>
</c:choose>
<div style="width:650px; text-align: center;">
	<br>
	<c:if test="${user.userId != null }">
		<textarea class="form-control" rows="5" id="replytext" placeholder="댓글을 작성하세요"></textarea>
		<button type="button" class="btn btn-success btn-xs" id="btninsertReply">댓글 작성</button>
	</c:if>
</div>
</center>
<div id="replyList"></div>
</body>
</html>