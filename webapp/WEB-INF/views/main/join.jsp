<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ������</title>

<script type="text/javascript">
	$("#joinForm").submit(function(){
		var $password = $("#password");
		var password = $password.val();
		if(password==""){
			alert("�н����带 �Է��� �ּ���");
			$password.focus();
			return false;	
		}
		
		var $email = $("#email");
		var email = $email.val();
		if(email ==""){
			alert("�̸����� �Է��� �ּ���");
			$email.focus();
			return false;
		}
/* 	    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		   if( re.test(email)==false){
				alert("��ȿ�� �̸��� ������ �ƴմϴ�");
				$email.focus();
				return false;	
		   }		 
 */		return true;
	});
</script>



<!--     <script>
    function checkIdValid(){
		var $email = $("#email");
		var email = $email.val();
		if (email == "") {
			return;
		}
		$.ajax({
			type : 'get',
			url : '/checkId',
			data : {
				email : email
			},
			dataType : 'json',
			success : function(response) {
				if (response.exist == "exist") {
					alert("�̹� �����մϴ�.");
					availId = "no";
				}
				if (response.exist == "no exist") {
					alert("��밡���մϴ�.");
					availId = "yes";
				}
			}
		});
	}
    </script> -->



<style>
body{background: #4E535B;font-family: 'Montserrat', Arial;font-size: 1em;}
h2{text-align: center;color: #F1F2F4;text-shadow: 0 1px 0 #000;}
a{text-decoration: none; color: #EC5C93; }
.ribbon{
  background: rgba(200,200,200,.5);
  width: 50px;
  height: 70px;
  margin: 0 auto;
  position: relative;
  top: 19px;
  border: 1px solid rgba(255,255,255,.3);
  border-top: 2px solid rgba(255,255,255,.5);
  border-bottom: 0;  
  border-radius: 5px 5px 0 0;
  box-shadow: 0 0 3px rgba(0,0,0,.7); 
}
.ribbon:before{
  content:"";
  display: block;
  width: 15px;
  height: 15px;
  background: #4E535B;
  border: 4px solid #cfd0d1;
  margin: 18px auto;
  box-shadow: inset 0 0 5px #000, 0 0 2px #000, 0 1px 1px 1px #A7A8AB;
  border-radius: 100%;
}
.login{
  background: #fff;
  border-bottom: 2px solid #C5C5C8;
  border-radius: 5px;
  text-align: center;
  color: #36383C;
  text-shadow: 0 1px 0 #FFF;
  max-width: 400px;
  margin: 0 auto;
  padding: 15px 40px 20px 40px;
  box-shadow: 0 0 3px #000;
}
.login:before{
  content:"";
  display: block;
  width: 70px;
  height: 4px;
  background: #4E535B;
  border-radius: 5px;
  border-bottom: 1px solid #FFFFFF;
  border-top: 2px solid #CBCBCD;
  margin: 0 auto;
}
h1{
  font-size: 1.6em;
  margin-top: 30px;
  margin-bottom: 10px;
}
p{
  font-family:'Helvetica Neue';
  font-weight: 300;
  color: #7B808A;
  margin-top: 0;
  margin-bottom: 30px;
}
.input{
  text-align: right;
  background: #E5E7E9;
  border-radius: 5px;
  overflow: hidden;
  box-shadow: inset 0 0 3px #65686E;
  border-bottom: 1px solid #FFF;
}
input{
  width: 260px;
  background: transparent;
  border: 0;
  line-height: 3.6em;
  box-sizing: border-box;
  color: #71747A;
  font-family:'Helvetica Neue';
  text-shadow: 0 1px 0 #FFF;
}
input:focus{
  outline: none;
}
.blockinput{
  border-bottom: 1px solid #BDBFC2;
  border-top: 1px solid #FFFFFF;
}
.blockinput:first-child{
  border-top: 0;
}
.blockinput:last-child{
  border-bottom: 0;
}
.blockinput i{
  padding-right: 110px;
  color: #B1B3B7;
  text-shadow: 0 1px 0 #FFF;
}
::-webkit-input-placeholder {
  color: #71747A;
  font-family:'Helvetica Neue';
  text-shadow: 0 1px 0 #FFF;
}
button{
  margin-top: 20px;
  display: block;
  width: 100%;
  line-height: 2em;
  background: #4291ca;
  border-radius: 5px;
  border:0;
  border-top: 1px solid #9ed2f8;
  box-shadow: 0 0 0 1px #247ab8, 0 2px 2px #808389;
  color: #FFFFFF;
  font-size: 1.5em;
  text-shadow: 0 1px 2px #21756A;
}
button:hover{
 background: linear-gradient(to bottom, #4096d3 0%,#3283be 100%);  
}
button:active{
  box-shadow: inset 0 0 5px #000;
  background: linear-gradient(to bottom, #3283be 0%,#4096d3 100%); 
}

/* ### TEST PASS GOOGLE IO ### */

hr{
  border-top: 1px solid rgba(0,0,0,.5);
  border-bottom: 1px solid rgba(255,255,255,.5);
  border-left: 0;
  border-right: 0;
  margin-top: 30px;
}

.io{
  padding: 0;
  padding-bottom: 10px;
}
.press{
  background: #D73D32;
  height: 40px;
  margin-top: -7px;
  border-radius: 5px 5px 0 0;
  text-align: left;
  line-height: 40px;
  padding: 0 10px;
  color: #FFF;
  text-shadow: none;
}
.press span{
  float: right;
  font-family: Georgia;
}
.io:before{
  position: relative;
  top: 15px;
  border-top: 2px solid #E78B84;
  border-bottom: 1px solid #6C1E19;
}
.ior{
  position:relative;
  z-index: 1;
}
.io img{
  width: 150px;
  border-radius: 100%;
  border: 4px solid 
  margin-top: 10px;
  border: 4px solid #FFF;
  margin: 18px auto 0;
  box-shadow: 0 1px 1px 1px #A7A8AB;
}
.io h2{
  margin-top: 0;
}
.io p{
  font-size: 1.5em;
  margin-bottom: 5px;
}

</style>

</head>
<link href="/assets/css/main/ws.css" rel="stylesheet" />

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.leanModal.min.js"></script>
<script>
if(${param.a}='error'){
	  alert("���̵�� ��й�ȣ�� Ʋ�Ƚ��ϴ�!");
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
		 
	    //���̽��� �α��� ��ư�� ������ ���� ��ƾ.  
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

// FB.getLoginStatus() ��� ȣ��
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);

  if (response.status === 'connected') {
    testAPI();
  } else if (response.status === 'not_authorized') {
    document.getElementById('status').innerHTML = 'Please log into this app.';
  } else {
    document.getElementById('status').innerHTML = '���̽��Ͽ� �α����� �Ǿ����� �ʽ��ϴ�.';
  }
}

//�α��� �Ϸ�, �Լ�ȣ��
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

// �α����� testApi �׽�Ʈ�� ���� statusChangeCallback()
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', function(response) {
    console.log('Successful login for: ' + response.name);
    document.getElementById('status').innerHTML ='<span style="font-weight:bold">'+response.name+'</span>������ ���̽��Ͽ� �α��� �Ǿ��ֽ��ϴ�.';
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
display: none; 
}
</style>
<body>
	<video src="/assets/img/yoga.mp4" autoplay ></video>
<!-- <iframe width="100%" height="900px" src="https://www.youtube.com/embed/02uiHmFuQaA?autoplay=1" frameborder="0" allowfullscreen autoplay></iframe> -->

  
	<a id="join" rel="leanModal" href="#joinModal">join header</a>
	<div id="joinModal">
			   <div class="wsTable" style="border:none; width:100%; height:100%;">
			   
			   
			   <div class="ribbon"></div>
				  <div class="login">
				  <h1>Sign in</h1>
				  <p>������ ȸ���������� ���񽺸� �̿��Ͻ� �� �ֽ��ϴ�.</p>
				  <form action="/join" method="post" id="joinForm">
				    <div class="input">
				      <div class="blockinput">
				        <i class="icon-envelope-alt"></i><input type="mail" placeholder="Email" name="email">
				      </div>
				      <div class="blockinput">
				        <i class="icon-unlock"></i><input type="password" placeholder="Password" name="password">
				      </div>
				    </div>
				   <!--  <button id="checkId" onclick="checkIdValid()" style="height:30px;font-size:14px;margin-bottom:-10px">email check</button> -->
				    <button type="submit">Sign in</button>
				  </form>
			   <div style="text-align:right;margin-top:20px;font-family:''���� ���;"><a href="#" onclick="$('#joinModal').hide();$('#login').click();">�α���</a></div>
<!-- <spsn style="font-size: 12px;">���Թ�ư�� �����ø� �ڵ����� <a href="#">�̿���</a>�� �����Ͻô� ������ ó���˴ϴ�.</span> -->
			   </div>
			   

<!-- 							<button onclick="$('#picktheme').click();$('#joinModal').hide();">����</button> -->


			
					
			    </div> 
	</div>
	
		<a id="login" rel="leanModal" href="#loginModal">join header</a>
	<div id="loginModal" >
			   <div class="wsTable" style="border:none; width:100%; height:100%;">
<!-- 					<button onclick="$('#picktheme').click();$('#joinModal').hide();">����</button> -->

				<div class="ribbon"></div>
				  <div class="login">
				  <h1>Login</h1>
				  <p>�α����� �Ͻø� �� ���� ����� �̿��Ͻ� �� �ֽ��ϴ�.</p>
				  <form action="/login" method="post">
				    <div class="input">
				      <div class="blockinput">
				        <i class="icon-envelope-alt"></i><input type="mail" placeholder="Email" name="email">
				      </div>
				      <div class="blockinput">
				        <i class="icon-unlock"></i><input type="password" placeholder="Password" name="password">
				      </div>
				    </div>
				    <button type="submit">Login</button>
				  </form>
				 
			<div style="text-align:center;margin-top:50px">
				<h1>Facebook Login</h1>
				<div style="float:left;width:400px;margin-top:-10px">
				<button class="btn btn-primary" style="float:left;width:190px; height:30px;font-size:13px" onclick="facebooklogin();">Facebook �α���</button>
				<button class="btn btn-primary" style="float:right;width:190px; height:30px;font-size:13px" id="logout" onclick=" logout();">Facebook �α׾ƿ�</button>
				</div>
				<div id="status" style="margin-top:70px;font-size:12px;"></div>
			</div>
				  
			<div style="text-align:right;margin-top:20px;font-family:''���� ���"><a href="#" onclick="$('#loginModal').hide();$('#join').click();">�����ϱ�</a></div>	  
				  </div>
					

			   
			    </div>
	</div>

<script type="text/javascript">
  $('a[rel*=leanModal]').leanModal();
  $("#login").click();
</script>
<script>
$('#logout').click(function(){
	alert("�α׾ƿ� �Ǿ����ϴ�.");
});
</script>
</body>
</html>