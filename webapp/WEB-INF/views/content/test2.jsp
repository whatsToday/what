<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1198930996801400',
      xfbml      : true,
      version    : 'v2.4'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>


<div
  class="fb-like"
  data-share="true"
  data-width="450"
  data-show-faces="true">
</div>






<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.4&appId=1198930996801400";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div class="fb-login-button" data-max-rows="1" data-size="medium" data-show-faces="false" data-auto-logout-link="false"></div> -->



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
	    var fbname;  
	    var accessToken = response.authResponse.accessToken;  
	    FB.api('/me', function(response) {
	    	var path="http://www.mymarket.com/user/loginBySns";
	    	var name = response.name;
	    	var email = response.id;
	    	var method="post";
	    	
	    	console.log(response.name);
	    	console.log(response.id);
	    	
	    	post_to_url(path,name,email,null,null,method);
	    	
	    	
	    	
	    });   
	  });  
	}  

   function logout(){
		  FB.logout(function(response){});
   }
   

</script>



<button class="btn btn-primary" style="width:240px; height:40px;" onclick="facebooklogin();">
Facebook 계정으로 로그인
</button>

<button class="btn btn-primary" style="width:240px; height:40px;" onclick=" logout();">
Facebook 계정 로그아웃
</button>

<div ></div>

</body>
</html>