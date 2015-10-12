<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--css -->
<link href="/assets/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/navi.css" rel="stylesheet" type="text/css"  media="screen" /> 
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<!-- script -->
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>
 
<script>
$(function(){
	//사용자 입력값에 대한 Validation
	$("form[name='loginform']").submit(function(){
		//1. 아이디
		var $memberId = $("#id")
		var memberId = $memberId.val();
		if(memberId ==""){
			alert("아이디를 입력해주세요");
			$memberId.focus();
			return false;
		}
		var $password = $("#pw");
		var password = $password.val();
		if(password ==""){
			alert("비밀번호를 입력해주세요");
			$password.focus();
			return false;		
		}
		return true;
	});
})
</script>


<header>
        <div class="navbar navbar-default navbar-static-top">

		<div id="menu_div">
			<div id="navigation">
				<div id="menu">
					<div class="masthead">
											<ul id="nav">
												<li><a href="/"  style="margin:15px 0 0 -15px;width:150px"><img style="width:150px;margin-left:-15px" src="/assets/img/logo.jpg"></a></li> 
												<li style="float:right;margin-right:220px"><a class="pink" href="/logout" >Logout</a></li>
								            	<li style="float:right"><a class="pink" href="/mycontent?member_no=${authUser.member_no}" >MyPage</a></li>
											</ul>
<!-- 											<ul class="nav nav-pills pull-right"> -->
<%-- 									          <li><a href="/mycontent?member_no=${authUser.member_no}" >MyPage</a></li> --%>
<!-- 									          <li><a href="/logout" >Logout</a></li> -->
<%-- 									          <li><img style="width:45px;height:45px;border-radius:45px;overflow:hidden" src="${authUser.imageUrl }"/></li> --%>
<!-- 									        </ul>										 -->
											
											
											<div style="float:right;margin-top:-55px"><img style="width:45px;height:45px;border-radius:45px;overflow:hidden" src="${authUser.imageUrl }"/></div>
					</div>
											
											
			<!-- Search Form -->
				<form class="searchform" action="#" style="margin-top:13px;margin-right:45px" > 
					<input class="searchfield" type="text" value="Search..." onfocus="if (this.value == 'Search...') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search...';}" />
				</form>
			<!-- / Search Form -->
				</div>
			</div>
		</div>
            </div>
        <!-- </div> -->
	</header>

	
	
<!-- 모달팝업 로그인 -->
<c:choose>
	<c:when test="${empty authUser }">		
		<div id="loginmodal" style="display:none;">
				<form name = "loginform" method="post" action="/member/login">
				 <h2>LOGIN</h2>
				 <div class="p_c_text" style="margin-top:20px">회원이 되시면 여러가시 혜택을 누리실 수 있습니다.</div>
				 <div class="login_line">
				  <div class="box_in" style="margin-top:15px">
				  <input type="text" name="memberId" id="id" size="23" value="hani89">
				  <input type="password" name="password" id="pw" size="23">
				  </div>
				  <input type="submit" value="LOGIN" class="btn_login1"  style="margin-top:12px">
				 </div>
				<div class="find_join"><a href="">아이디 / 비밀번호 찾기</a> | <a href="/member/joinForm">회원가입</a></div>
			</form>
		</div>
	</c:when>
	<c:otherwise>
		<div></div>
	</c:otherwise>
</c:choose>


 <script type="text/javascript">
$(function(){
  $('#loginform').submit(function(e){
	  return false;
  });
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
$(function(){
	$('#modaltrigger2').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
</script>
 <script >
function planner(num){
	if(num==1){
		alert("로그인하시오");
	}if(num==2){
		location.href="/planner";
	}
}
</script>
