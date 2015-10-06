<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

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
FB.init({
  appId      : '1198930996801400',
  cookie     : true, 
  xfbml      : true,  
  version    : 'v2.2'
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
      response.name + '님으로 로그인 되어있습니다.';
  });
}

</script>








<div>
<button class="btn btn-primary" style="width:240px; height:30px;" onclick="facebooklogin();">
Facebook 계정으로 로그인
</button>
<button class="btn btn-primary" style="width:240px; height:30px;" id="logout" onclick=" logout();">
Facebook 계정 로그아웃
</button>
</div>

<div class="fb-like" data-share="true" data-width="450" data-show-faces="true"></div>

<div id="status"></div>
<!-- <div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="false"></div>  -->


<script>
$('#logout').click(function(){
	alert("로그아웃 되었습니다.");
});
</script>
</body>
</html>