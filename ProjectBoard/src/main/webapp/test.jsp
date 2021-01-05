<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel=stylesheet href=/resources/css/bootstrap.min.css>
<link rel=stylesheet href=/resources/css/bootstrap-theme.min.css>
<link rel=stylesheet href=/resources/css/sumoselect.css>
<script type=text/javascript src=/resources/js/bootstrap.js></script>
<script src=/resources/jquery-3.5.1.min.js></script>
<script src=/resources/js/jquery.sumoselect.min.js></script>

<title>새글 등록</title>
</head>
<script>
$(document).ready(function(){
    // selectbox styling
	
  
	 

});

function passForm(){
	
	var output="";
	
	output += "<div class=row>";
	output += "<div class=form-group style='line-height:40px'>";
	output += "<div class='col-md-1 col-md-offset-3' >";
	output += "<label for=password >비밀번호</label><br>";
	output += "</div>";
	output += "<div class=col-md-4 >";
	output += "<input type=password class=form-control maxlength=20 name=password id='password' placeholder='비밀번호를 입력하세요.' />";
	output += "</div>";
	output += "</div>";
	output += "</div>";
	output += "<div class=row>";
	output += "<div class='col-md-5 col-md-offset-4' style='line-height:10px;font-size:10px;position:relative;bottom:10px' >";
	output += "<p id='pass_base' style='display:block'>4~20자 영문, 숫자, 특수문자를 포함해 주세요.(이전 비밀번호는 사용할 수 없습니다)</p>";
	output += "<p id='pass_poss' style='display:none;color:blue'>사용 가능한 비밀번호입니다.</p>";	
	output += "<p id='pass_imposs' style='display:none;color:red'>사용할 수 없는 비밀번호입니다.</p>";
	output += "<p id='pass_before' style='display:none;color:red'>이전 비밀번호와 일치합니다.</p>";
	output += "</div>";
	output += "</div>";
	output += "<div class=row>";
	output += "<div class=form-group style='line-height:40px'>";
	output += "<div class='col-md-1 col-md-offset-3' >";
	output += "<label for=password>재확인</label><br>";
	output += "</div>";
	output += "<div class=col-md-4 >";
	output += "<input type=password class=form-control maxlength=20 name=password_ch id='password_ch' placeholder='비밀번호를 재확인해주세요.' /> ";
	output += "</div>";
	output += "</div>";
	output += "</div>";
	output += "<div class=row>";
	output += "<div class='col-md-3 col-md-offset-4' style='line-height:10px; font-size:10px' >";
	output += "<p id='pass_ch_base' style='display:block'></p>";
	output += "<p id='pass_ch_poss' style='display:none;color:blue' >비밀번호가 일치합니다.</p>";
	output += "<p id='pass_ch_imposs' style='display:none;color:red'>비밀번호가 일치하지 않습니다.</p>";
	output += "</div>";
	output += "</div>";

	$("#passBtn").attr("value","Y");
	$("#passUpdate").html(output);
	

	 var passv = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{4,20}$/);
	 $("#password").on("propertychange change keyup paste input", function(){
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
	
}
</script>

<body>
 
 <div id="passUpdate">
 <div class="row">
		<div class="form-group" style="line-height:40px">
			<div class="col-md-1 col-md-offset-3" >
				<label for="password">비밀번호</label><br>
			</div>
			<div class="col-md-4" >
				<button type="button" class="btn btn-default" id="passBtn" onclick="passForm()" value="N">비밀번호 변경하기</button>
			</div>
		</div>
	</div>
	</div>

 


</html>
		
		