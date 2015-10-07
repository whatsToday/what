<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ������</title>
</head>
<link href="/assets/css/main/ws.css" rel="stylesheet" />

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.leanModal.min.js"></script>
<script>
if(${param.a}='error'){
	  alert("�α��� ����!");
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
    document.getElementById('status').innerHTML =
      '<span style="font-weight:bold">'+response.name + '</span>������ ���̽��Ͽ� �α��� �Ǿ��ֽ��ϴ�.';
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
							<td style="text-align:right" ><a href="#" onclick="$('#joinModal').hide();$('#login').click();">�α���</a></td>
				     	</tr>
				     	<tr>
				     		<td><strong>ȸ�������� �Ͻø� �� ���� ����� �̿��Ͻ� �� �ֽ��ϴ�</strong></td>
				     	</tr>
						<tr>
							<td><input type="text" placeholder="�̸��� �ּ�"  id="email" name="email"/></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="��й�ȣ" id="password" name="password"/></td>
						</tr>     
						<tr>
							<td><input type="submit" value="����"></input></td>
<!-- 							<td><button onclick="$('#picktheme').click();$('#joinModal').hide();">����</button></td> -->
						</tr>
						<tr>
							<td><strong style="font-size: 4px;">���Թ�ư�� �����ø� �ڵ����� <a href="#">�̿���</a>�� �����Ͻô� ������ ó���˴ϴ�.</strong></td>
						</tr>     
				     </table>
					</form>
			
					
			    </div> 
	</div>
	
		<a id="login" rel="leanModal" href="#loginModal">join header</a>
	<div id="loginModal">
			   <div class="wsTable" style="border:none; width:100%; height:100%;">
			   		<h4 style="text-align:center;margin-top:10px">�α����� �Ͻø� �� ���� ����� �̿��Ͻ� �� �ֽ��ϴ�</h4>
				   <form action="/login" method="post" >
				     <table>
						<tr>
							<td><input  type="text" placeholder="�̸��� �ּ�" name="email"/></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="��й�ȣ" name="password"/></td>
						</tr>     
						<tr>
							<td><input type="submit" value="�α���"></input></td>
<!-- 							<td><button onclick="$('#picktheme').click();$('#joinModal').hide();">����</button></td> -->
						</tr>
				     </table>
					</form>
					
			<div style="text-align:center;margin-top:50px">
				<h4>���̽������� �α��� �� �� �ֽ��ϴ�.</h4>
				<button class="btn btn-primary" style="width:240px; height:30px;" onclick="facebooklogin();">
				Facebook �α���
				</button>
				<button class="btn btn-primary" style="width:240px; height:30px;" id="logout" onclick=" logout();">
				Facebook �α׾ƿ�
				</button>
				<div id="status" style="margin-top:10px;font-size:12px;"></div>
			</div>
					
					
				<div style="text-align:right"><a href="#" onclick="$('#loginModal').hide();$('#join').click();">�����ϱ�</a></div>
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
<script type="text/javascript">
	$("#joinForm").submit(function(){

		var $email = $("#email");
		var email = $email.val();
// 		alert(email);
		console.log(email);
		if(email ==""){
			alert("�̸����� �Է��� �ּ���");
			$email.focus();
			return false;
		}
		 
		var $password = $("#password");
		var password = $password.val();
		if(password==""){
			alert("�н����带 �Է��� �ּ���");
			$password.focus();
			return false;	
		}
		return true;
	});
</script>
</body>
</html>