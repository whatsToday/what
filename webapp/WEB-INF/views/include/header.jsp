<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--css -->
<link href="/assets/css/layout.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/assets/css/navi.css" media="screen" /> 

 
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
<!--             <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/"><span>오늘</span> 뭐하지<span>?</span></a>
                </div> -->

		<div id="menu_div">
			<div id="navigation">
				<div id="menu">
					<c:choose>
					<c:when test="${empty authUser }">
					<ul id="nav">
						<li><a href="/"  style="margin:15px 0 0 -15px;width:150px"><img style="width:150px;margin-left:-15px" src="/assets/img/logo.jpg"></a></li> 
						<li style="margin-left:10px"><a href="javascript:planner(1)">일정짜기</a></li>
						<li><a href="/review">게시판</a></li>
						<li style="float:right;margin-right:220px"><a class="pink" href="/member/joinForm">Join</a></li>
						<li style="float:right"><a class="pink" href="#loginmodal"  id="modaltrigger">Login</a></li>
					</ul>
					<div style="float:right;margin-top:-55px"><img style="width:45px;height:45px;border-radius:45px;overflow:hidden" src="/assets/img/no_img.jpg"/></div>
			</c:when>
			<c:otherwise>
					<ul id="nav">
						<li><a href="/"  style="margin:15px 0 0 -15px;width:150px"><img style="width:150px;margin-left:-15px" src="/assets/img/logo.jpg"></a></li> 
						<li style="margin-left:10px"><a href="javascript:planner(2)">일정짜기</a></li>
						<li><a href="/review">게시판</a></li>
						<li style="float:right;margin-right:220px"><a class="pink" href="/member/logout" >Logout</a></li>
		            	<li style="float:right"><a class="pink" href="/mypage" >MyPage</a></li>
		            	<c:choose>
		            	<c:when test="${not empty themeList }">
		            	<li style="float:right"><a class="pink" href="#interset"  id="modaltrigger">Interest</a></li>
		            	</c:when>
		            	<c:otherwise>
		            	<li style="float:right"><a class="pink" href="#interset"  id="modaltrigger"></a></li>
		            	</c:otherwise>
		            	</c:choose>
					</ul>
					<div style="float:right;margin-top:-55px"><img style="width:45px;height:45px;border-radius:45px;overflow:hidden" src="${authUser.imageUrl }"/></div>
			</c:otherwise>
			</c:choose>	
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



<!-- 모달팝업 interset -->
		<div>
		<div id="interset" style="display:none;">
			<div style="width:250px;background-color:#fff;color:#2f3238;height:680px;text-align:center;font-size:15px;border-radius:10px;border:solid 6px #FDB7C8">
				<div style="font-weight:bold;padding:10px;font-size:16px;height:50px;margin-top:10px">${authUser.memberName }님의 관심사</div>
			<form name ="interest" method="post" action="/interestupdate">
	<c:forEach var="vo" items="${themeList }" varStatus="status">
				<input type="hidden" name="member_no" value="${authUser.member_no }">
<%-- 		<div style="float:left;width:120px;height:100px;margin:10px">
				<img style="width:120px;height:100px" src="/assets/img/noimage.jpg">
				<input class="checkTheme" type="checkbox" name="theme_no" value="${vo.theme_no }">${vo.themeName}
				</div> --%>
				<div>
				<input class="checkTheme" type="checkbox" name="theme_no" value="${vo.theme_no }">${vo.themeName}
				</div>
	</c:forEach>
				<input type="submit" value="관심사로검색" style="color:#000;width:150px;height:30px;margin-top:20px" >
			</form>
			</div>
			</div>
			</div>
			<script>
			var userTheme_no = [];
			$.ajax({
				type : 'get',
			    url:'/getInterest',
			    data : {
			    		member_no : '${authUser.member_no}'
			    },
			    dataType:'json',
			    success: function(response){
			    	for(var i=0; i<response.length; i++){
			    		userTheme_no[i]=response[i].theme_no;
			    	$("input[value="+userTheme_no[i]+"]").attr("checked", true);
			    	}
			    }
			 })
			 
			</script>
			<script>
			$(function(){
			    var max = 5;
			    var checkboxes = $('input[type="checkbox"]');

			    checkboxes.change(function(){
			        var current = checkboxes.filter(':checked').length;
			        checkboxes.filter(':not(:checked)').prop('disabled', current >= max);
			    });
			});
			</script>




 <script type="text/javascript">
$(function(){
  $('#loginform').submit(function(e){
	  return false;
  });
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
});
$(function(){
	$('#modaltrigger2').leanModal2({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
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
