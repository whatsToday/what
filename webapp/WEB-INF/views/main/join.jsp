<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>오늘 뭐하지</title>
</head>
<link href="/assets/css/main/ws.css" rel="stylesheet" />

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.leanModal.min.js"></script>
<script>
if(${param.a}='error'){
	  alert("로그인 실패!");
}
</script>



<script>
 window.fbAsyncInit = function() {  
	    FB.init({appId: "1198930996801400", tatus: true, cookie: true, xfbml: true});      
	};  

	(function(d){  
	   var js, id = "facebook-jssdk", ref = d.getElementsByTagName("script")[0];  
	   if (d.getElementById(id)) {return;}  
	   js = d.createElement("script"); js.id = id; js.async = true;  
	   js.src = "//connect.facebook.net/en_US/all.js";  
	   ref.parentNode.insertBefore(js, ref);  
	 }(document));     

	function facebooklogin() {  
		 
	    //페이스북 로그인 버튼을 눌렀을 때의 루틴.  
	  FB.login(function(response) {  
	    FB.api('/me', function(response) {
	    	var name = response.name;
	    	var email = response.id;
	    	var imageUrl = "http://graph.facebook.com/"+response.id+"/picture?type=large";
	    	
	    	function post(path, params, method) {
	    	    method = method || "post"; 
	    	    
	    	    var form = document.createElement("form");
	    	    form.setAttribute("method", method);
	    	    form.setAttribute("action", path);

	    	    for(var key in params) {
	    	        if(params.hasOwnProperty(key)) {
	    	            var hiddenField = document.createElement("input");
	    	            hiddenField.setAttribute("type", "hidden");
	    	            hiddenField.setAttribute("name", key);
	    	            hiddenField.setAttribute("value", params[key]);

	    	            form.appendChild(hiddenField);
	    	         }
	    	    }

	    	    document.body.appendChild(form);
	    	    form.submit();
	    	}

	    	post('/facebook', {email: email, memberName:name, imageUrl:imageUrl});

			console.log(response.name);
	    });   
	  });  
	}  

   function logout(){
		  FB.logout(function(response){});
   }
      
</script>
<script>

// FB.getLoginStatus() 결과 호출
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);

  if (response.status === 'connected') {
    testAPI();
  } else if (response.status === 'not_authorized') {
    document.getElementById('status').innerHTML = 'Please log into this app.';
  } else {
    document.getElementById('status').innerHTML = '페이스북에 로그인이 되어있지 않습니다.';
  }
}

//로그인 완료, 함수호출
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

window.fbAsyncInit = function() {
	FB.init({appId: '1198930996801400',cookie: true, xfbml:true,version: 'v2.2'
});

FB.getLoginStatus(function(response) {
  statusChangeCallback(response);
});

};

// 로그인후 testApi 테스트를 실행 statusChangeCallback()
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', function(response) {
    console.log('Successful login for: ' + response.name);
    document.getElementById('status').innerHTML =
      '<span style="font-weight:bold">'+response.name + '</span>님으로 페이스북에 로그인 되어있습니다.';
  });
}

</script>

<style>

a[rel=leanModal] {
	visibility: hidden;
}

#lean_overlay {
    position: fixed;
    z-index:100;
    top: 0px;
    left: 0px;
    height:100%;
    width:100%;
    background: #000;
    display: none;
}

#joinModal,#loginModal {
width: 716px;
height: 430px;
/* width: 600px; */
/* padding: 30px; */
display: none; 
background: #FFF;
border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
box-shadow: 0px 0px 4px rgba(0,0,0,0.7);
-webkit-box-shadow: 0 0 4px rgba(0,0,0,0.7);
-moz-box-shadow: 0 0px 4px rgba(0,0,0,0.7);

/* background-image:url('/assets/img/loginbg.jpg'); */
background-size: 100% 100%;
background-repeat: no-repeat;
}
</style>
<body>
	<video src="/assets/img/yoga.mp4" autoplay ></video>
<!-- <iframe width="100%" height="900px" src="https://www.youtube.com/embed/02uiHmFuQaA?autoplay=1" frameborder="0" allowfullscreen autoplay></iframe> -->

  
	<a id="join" rel="leanModal" href="#joinModal">join header</a>
	<div id="joinModal">
			   <div class="wsTable" style="border:none; width:100%; height:100%;">
				   <form action="/join" method="post" id="joinForm">
				     <table>
						<tr>
							<td style="text-align:right" ><a href="#" onclick="$('#joinModal').hide();$('#login').click();">로그인</a></td>
				     	</tr>
				     	<tr>
				     		<td><strong>회원가입을 하시면 더 많은 기능을 이용하실 수 있습니다</strong></td>
				     	</tr>
						<tr>
							<td><input type="text" placeholder="이메일 주소"  id="email" name="email"/></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="비밀번호" id="password" name="password"/></td>
						</tr>     
						<tr>
							<td><input type="submit" value="가입"></input></td>
<!-- 							<td><button onclick="$('#picktheme').click();$('#joinModal').hide();">가입</button></td> -->
						</tr>
						<tr>
							<td><strong style="font-size: 4px;">가입버튼을 누르시면 자동으로 <a href="#">이용약관</a>에 동의하시는 것으로 처리됩니다.</strong></td>
						</tr>     
				     </table>
					</form>
			
					
			    </div> 
	</div>
	
		<a id="login" rel="leanModal" href="#loginModal">join header</a>
	<div id="loginModal">
			   <div class="wsTable" style="border:none; width:100%; height:100%;">
			   		<div style="text-align:right"><a href="#" onclick="$('#loginModal').hide();$('#join').click();">가입하기</a></div>
			   		<h4 style="text-align:center">로그인을 하시면 더 많은 기능을 이용하실 수 있습니다</h4>
				   <form action="/login" method="post" >
				     <table>
						<tr>
							<td><input  type="text" placeholder="이메일 주소" name="email"/></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="비밀번호" name="password"/></td>
						</tr>     
						<tr>
							<td><input type="submit" value="로그인"></input></td>
<!-- 							<td><button onclick="$('#picktheme').click();$('#joinModal').hide();">가입</button></td> -->
						</tr>
				     </table>
					</form>
					
			<div style="text-align:center;margin-top:50px">
				<h4>페이스북으로 로그인 할 수 있습니다.</h4>
				<button class="btn btn-primary" style="width:240px; height:30px;" onclick="facebooklogin();">
				Facebook 로그인
				</button>
				<button class="btn btn-primary" style="width:240px; height:30px;" id="logout" onclick=" logout();">
				Facebook 로그아웃
				</button>
				<div id="status" style="margin-top:10px;font-size:12px;"></div>
			</div>
					
					
			    </div>
	</div>

<script type="text/javascript">
  $('a[rel*=leanModal]').leanModal();
  $("#login").click();
</script>
<script>
$('#logout').click(function(){
	alert("로그아웃 되었습니다.");
});
</script>
<script type="text/javascript">
	$("#joinForm").submit(function(){

		var $email = $("#email");
		var email = $email.val();
// 		alert(email);
		console.log(email);
		if(email ==""){
			alert("이메일을 입력해 주세요");
			$email.focus();
			return false;
		}
		 
		var $password = $("#password");
		var password = $password.val();
		if(password==""){
			alert("패스워드를 입력해 주세요");
			$password.focus();
			return false;	
		}
		return true;
	});
</script>
</body>
</html>