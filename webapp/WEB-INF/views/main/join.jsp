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
<script type="text/javascript" src="/assets/js/jquery.leanModal.min.js"></script>
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
				   <form action="/join" method="post">
				     <table>
						<tr>
							<td style="text-align:right" ><a href="#" onclick="$('#joinModal').hide();$('#login').click();">로그인</a></td>
				     	</tr>
				     	<tr>
				     		<td><strong>회원가입을 하시면 더 많은 기능을 이용하실 수 있습니다</strong></td>
				     	</tr>
						<tr>
							<td><input  type="text" placeholder="이메일 주소" name="email"/></td>
						</tr>
						<tr>
							<td><input type="password" placeholder="비밀번호" name="password"/></td>
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
				   <form action="/login" method="post">
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
						<tr>
							<td><strong style="font-size: 4px;">가입버튼을 누르시면 자동으로 <a href="#">이용약관</a>에 동의하시는 것으로 처리됩니다.</strong></td>
						</tr>     
				     </table>
					</form>
			    </div>
	</div>

<script type="text/javascript">
  $('a[rel*=leanModal]').leanModal();
  $("#join").click();
</script>
</body>
</html>