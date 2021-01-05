<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="/WEB-INF/views/ref.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
    // selectbox styling
	 $('#slectBox').SumoSelect();

	 var idv = RegExp(/^[a-zA-Z0-9]{3,12}$/); 
	 var passv = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{4,20}$/);
	 $("#userId").on("propertychange change keyup paste input", function(){ 	 //아이디 유효성 검사=>영문 숫자포함하며 길이가 3이상인가확인
	 	var inpValue = $(this).val();
	 	if(inpValue == ""){
	 		$("#id_base").show();
	 		$("#id_poss").hide();
	 		$("#id_imposs").hide();
	 	} 
	 	else if((idv).test(inpValue) == true && inpValue.length > 2){
	 		$("#id_base").hide();
	 		$("#id_poss").show();
	 		$("#id_imposs").hide();
	 		$("#idChk").attr("disabled",false);
	 	}
	 	else if((idv).test(inpValue) == false || inpValue.length < 2){
	 		$("#id_base").hide();
	 		$("#id_poss").hide();
	 		$("#id_imposs").show();
	 		$("#idChk").attr("disabled",true);
	 	}
	 });

	 
	 $("#password").on("propertychange change keyup paste input", function(){ 	 //비밀번호 유효성 검사=>영문 숫자 특수문자조합으로길이가 4이상인가확인
		 	var inpValue = $(this).val();
		 	if(inpValue == ""){
		 		$("#pass_base").show();
		 		$("#pass_poss").hide();
		 		$("#pass_imposs").hide();
		 	} 
		 	else if((passv).test(inpValue) == true && inpValue.length > 4){
		 		$("#pass_base").hide();
		 		$("#pass_poss").show();
		 		$("#pass_imposs").hide();
		 	}
		 	else if((passv).test(inpValue) == false || inpValue.length < 4){
		 		$("#pass_base").hide();
		 		$("#pass_poss").hide();
		 		$("#pass_imposs").show();
		 	}
		 });
	 
	 $("#password_ch").on("propertychange change keyup paste input", function(){ 	 //비밀번호 재확인
		 	var inpValue = $(this).val();
		 	if(inpValue == ""){
		 		$("#pass_ch_base").show();
		 		$("#pass_ch_poss").hide();
		 		$("#pass_ch_imposs").hide();
		 	} 
		 	else if(inpValue == $("#password").val()){
		 		$("#pass_ch_base").hide();
		 		$("#pass_ch_poss").show();
		 		$("#pass_ch_imposs").hide();
		 	}
		 	else if(inpValue != $("#password").val()){
		 		$("#pass_ch_base").hide();
		 		$("#pass_ch_poss").hide();
		 		$("#pass_ch_imposs").show();
		 	}
		 });
	 
	
	 var element1 = document.getElementById('radio1'); //성별 라이오 버튼
	 var element2 = document.getElementById('radio2');
	 
	 $('#option2').on('click', function () {
		 element1.classList.remove('active');
		 element2.classList.add('active');
		 $("option2").attr("checked", true);
		 $("option1").attr("checked", false);
		 alert("여");	  
	 });
	 
	 $('#option1').on('click', function () {
		 element2.classList.remove('active');
		 element1.classList.add('active');
		 $("option2").attr("checked", false);
		 $("option1").attr("checked", true);
		 alert("남");	  
	 });

});

var telv = RegExp(/^[0-9]{11}$/);				//전화번호 유효성
var namev = RegExp(/^[가-힣]{2,15}/);				//이름 유효성
var email1v = RegExp(/^[a-zA-Z0-9]+$/);			//이메일1 유효성
var email2v = RegExp(/^[a-zA-Z0-9]+\.[a-z]+$/);	//이메일2 유효성
var birthv = RegExp(/^[0-9]{8}/)				//생년월일 유효성
function formSubmit(){
	if(document.insertForm.userId.value == ""){
		alert("아이디를 입력해주세요");
		return false;
	}
	else if(document.insertForm.password.value == ""){
		alert("입력한 비밀번호가 형식과 다릅니다");
		return false;
	}
	else if(document.getElementById("pass_poss").style.display == "none"){
		alert("비밀번호형식이 일치하지 않습니다");
		return false;
	}
	else if(document.getElementById("pass_ch_poss").style.display == "none"){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	else if(document.insertForm.name.value == ""){
		alert("이름을 입력해주세요");
		return false;
	}
	else if(!(namev).test(document.insertForm.name.value)){
		alert("이름을 한글 혹은 15자 이내로 적어주세요");
		return false;
	}
	else if(document.insertForm.email1.value == ""){
		alert("이메일을 입력해주세요");
		return false;
	}
	else if(!(email1v).test(document.insertForm.email1.value)){
		alert("입력한 이메일이 형식과 다릅니다");
		return false;
	}
	else if(document.insertForm.tel.value == ""){
		alert("전화번호를 입력해주세요");
		return false;
	}
	else if(!(telv).test(document.insertForm.tel.value)){
		alert("입력한 전화번호가 형식과 다릅니다");
		return false;
	}
	else if(document.insertForm.birth.value == ""){
		alert("생년월일을 입력해주세요");
		return false;
	}
	else if(!isBirthday(document.insertForm.birth.value)  || !(birthv).test(document.insertForm.birth.value)){
		alert("입력한 생년월일이 형식과 다릅니다");
		return false;
	}
	else if(document.insertForm.idChk.value == "N"){
		alert("중복확인 버튼을 눌러주세요");
		return false;
	}
	else if(document.insertForm.idChk.value == "D"){
		alert("아이디를 확인해주세요");
		return false;
	}
	
	
	
	return true;
}
function fn_idChk(){
	$.ajax({
		url : "/loginIdCheck.do",
		type : "post",
		contentType: 'application/json',
		data: JSON.stringify({
			'userId' : $("#userId").val()
		}),
		success : function(data){
			if(data == 1){
				$("#idChk").attr("value","D");
				alert("사용할 수 없는 아이디입니다");
			} else if(data == 0){
				$("#idChk").attr("value","Y");
				alert("사용가능한 아이디입니다");
			}
		}
	})
}

function fn_select(ema){
	if(ema.value !="self"){
		$("#email2").attr("disabled",true);
		$("#email2").attr("value",ema.value);
	}
	else {
		$("#email2").attr("disabled",false);
		$("#email2").val("");
	}
}

function isBirthday(dateStr) { 
	var year = Number(dateStr.substr(0,4)); 
	var month = Number(dateStr.substr(4,2));
	var day = Number(dateStr.substr(6,2)); 
	var today = new Date(); 
	var yearNow = today.getFullYear(); 
	if (dateStr.length <=8) { 
		if (1900 > year || year > yearNow){ 
		 		return false; 
			} 
		else if (month < 1 || month > 12) {
				 return false; 
			} 
		else if (day < 1 || day > 31) {
				 return false; 
			} 
		else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
				 return false; 
			} 
		else if (month == 2) { 
			var leap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)); 
			if (day>29 || (day==29 && !leap)) {
					return false; 
				} 
			else 
				return true;  
		}
		else  
			return true; 	
	}
	else 
		return false; 
}

</script>
</head>
<body>
<center>
<h1>회원가입하기</h1>
</center>
<hr><br><br>
<div class="container">
<form name="insertForm" onSubmit="return formSubmit();" action="insertUser.do" method="post">
<div class="row">
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-3" >
				<label for="userId">아이디</label><br>
			</div>
			<div class="col-md-4" >
				<input type="text" class="form-control" maxlength="12" name="userId" id="userId" placeholder="아이디를 입력하세요." />
			</div>
			<div class="col-md-1">
			<button id="idChk" type="button" class="btn btn-default btn-sm" onclick="fn_idChk()" value="N" style="position:relative;bottom:5px;"disabled>중복확인</button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 col-md-offset-4" style="line-height:10px; font-size:10px;position:relative;bottom:10px" >
		<p id="id_base" style="display:block">3~12자 영문, 숫자로 입력해 주세요.</p>
		<p id="id_poss" style="display:none;color:blue">사용 가능한 아이디입니다.</p>
		<p id="id_imposs" style="display:none;color:red">사용할 수 없는 아이디입니다.</p>
		</div>
	</div>
	<div class="row">
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-3" >
				<label for="password">비밀번호</label><br>
			</div>
			<div class="col-md-4" >
				<input type="password" class="form-control"  maxlength="20" name="password" id="password" placeholder="비밀번호를 입력하세요." /> 
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 col-md-offset-4" style="line-height:10px; font-size:10px;position:relative;bottom:10px" >
			<p id="pass_base" style="display:block">4~20자 영문, 숫자, 특수문자를 포함해 주세요.</p>
			<p id="pass_poss" style="display:none;color:blue">사용 가능한 비밀번호입니다.</p>
			<p id="pass_imposs" style="display:none;color:red">사용할 수 없는 비밀번호입니다.</p>
		</div>
	</div>
	<div class="row">
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-3" >
				<label for="password">재확인</label><br>
			</div>
			<div class="col-md-4" >
				<input type="password" class="form-control" maxlength="20" name="password_ch" id="password_ch" placeholder="비밀번호를 재확인해주세요."/> 
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 col-md-offset-4" style="line-height:10px; font-size:10px" >
			<p id="pass_ch_base" style="display:block"></p>
			<p id="pass_ch_poss" style="display:none;color:blue" >비밀번호가 일치합니다.</p>
			<p id="pass_ch_imposs" style="display:none;color:red">비밀번호가 일치하지 않습니다.</p>
		</div>
	</div>
	<div class="row">
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-3" >
				<label for="name">이름</label><br>
			</div>
			<div class="col-md-4" >
				<input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요." /> 
			</div>
		</div>
	</div>
	<div class="row" >
		<div class="form-group " style="line-height:40px;">
			<div class="col-md-1 col-md-offset-3" >
				<label for="name">e-mail</label><br>
			</div>
			<div class="col-md-2" >
				<input type="text" maxlength="30" style="text-transform:lowercase" class="form-control" name="email1" id="email1"  /> 
			</div>
			<span style="float:left; font-weight:bold; position:relative; right:7px">@</span>
			<div class="col-md-2" style="position:relative; right:13px" >
				<input type="text" maxlength="30" style="text-transform:lowercase;" class="form-control" name="email2" id="email2"  disabled /> 
			</div>
		</div>
		<select id="slectBox"  name="email3" onchange="fn_select(this)" style="position:relative;bottom:34px;">	
				<option selected value="">이메일입력</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="daum.net">daum.net</option>
				<option value="self">직접입력</option>
			</select>
	</div>
	
	<div class="row">
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-3" >
				<label for="name">전화번호</label><br>
			</div>
			<div class="col-md-4" >
				<input type="text" class="form-control" name="tel" id="tel" placeholder="[-]없이 입력(예 : 01012345678)" maxlength="11"/> 
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-3" >
				<label for="name">생년월일</label><br>
			</div>
			<div class="col-md-4" >
				<input type="text" class="form-control" name="birth" id="birth" placeholder="(예 : 19940101)" maxlength="8"/> 
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-3" >
				<label for="name">성별</label><br>
			</div>
			<div class="btn-group col-md-3" data-toggle="buttons" >
				<label id="radio1" class="btn btn-default ">
					<input type="radio" name="sex" id="option1" autocomplete="off" value="남자" />남자
				</label>
				<label id="radio2" class="btn btn-default">
					<input type="radio" name="sex" id="option2" autocomplete="off" value="여자" />여자
				</label>
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