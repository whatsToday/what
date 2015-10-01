<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!--css -->
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/mycontent.css" rel="stylesheet" type="text/css" />
<!-- script -->
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/jquery.leanModal.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘 뭐하지?</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/include/header.jsp"/> 
	<div class="container">
			<div class="omu"><img src="/assets/img/omu.jpg"></div>
		<div class="mycontent" >
				<div class="top">
				<div class="pro"><img class="image_pro" src="${memberVo.imageUrl}"/></div>
				<ul><li class="soo">${followingList.size()}</li><li class="top_menu">팔로잉</li><li><a href='javascript:viewFollowing("${memberVo.member_no}")'>팔로잉보기</a><ul id="followingList"><c:forEach var="i" items="${followingList}"><a href="/mycontent?member_no=${i.followingNum}"><li><img src="${i.Url}"><span>${i.followingName}</span></li></a></c:forEach></ul></li></ul>
				<ul><li class="soo">${followerList.size()}</li><li class="top_menu">팔로워</li><li><a href='javascript:viewFollower("${memberVo.member_no}")'>팔로워보기</a><ul id="followerList"><c:forEach var="i" items="${followerList}"><a href="/mycontent?member_no=${i.followerNum}"><li><img src="${i.Url}">${i.followerName}</li></c:forEach></ul></li></a></ul>
				<ul><li class="soo">${planList.size()}</li><li class="top_menu">게시물</li><c:if test="${authUser.member_no == param.member_no }"><li><a href="/board/addBoard">게시물쓰기</a></li></c:if></ul>
				<c:choose>
				<c:when test="${authUser.member_no == param.member_no}">
				<div class="pro_modi"><a href="#modifyForm" id="modify">프로필 편집</a></div>
				</c:when>
				<c:when test="${not empty followerList}">
				<div class="pro_modi1"><a href="javascript:unFollow(${memberVo.member_no},${authUser.member_no});">팔로우 됨<img src="/assets/img/button/check.png"></a></div>
				</c:when>
				<c:otherwise>
				<div class="pro_modi"><a href="javascript:follow(${memberVo.member_no},${authUser.member_no});">팔로우하기</a></div>
				</c:otherwise>
				</c:choose>
				<div class="pro_name">${memberVo.memberName}</div>
				</div>
				<div class="menu">
					<ul id="squaresStyle">
						<li><a href="javascript:squares();"><img src="/assets/img/button/squares.png"/></a></li>
					</ul>
					<ul id="menuStyle">
						<li><a href="javascript:menu();"><img src="/assets/img/button/menugray.png"/></a></li>
					</ul>
					<ul id="mapStyle">
						<li><a href="javascript:getMap();"><img src="/assets/img/button/mapgray.png"/></a></li>
					</ul>
				</div>
				
				<div class="content">
				
				<c:forEach var="i" items="${planList}">
				<ul class="squares">
				<li><a href="/board?plan_no=${i.plan_no}"><img src="${i.titleImage}"/></a></li>
				</ul>
				</c:forEach>
				
				<c:forEach var="i" items="${planList}">
				<ul class="menuView">
				<img src="${i.titleImage}"/>
				<li>${i.planName}</li>
				<li>${i.message}</li>
				<li id="comment"><a>종아요</a>&nbsp&nbsp<a>댓글</a></li>
				</ul>
				</c:forEach>
				<div id="map" style="display:none"></div>
				</div>
				<div class="bottom"></div>
		</div>
	</div>
	</div>
	<div id="modifyForm" style="display:none; ">
				<div style="width:620px;height:300px;background-color:#fff;font-color:#c7c7c7;font-size:15px;padding:10px">
				<form method="post" action="#">
					<div style="float:left"><img style="width:300px; height: 250px;" src="${memberVo.imageUrl}"></div><a style="position:fixed;margin-top:260px; margin-left:-300px;"href="javascript:mainPhoto()">사진변경</a><input type="file" id="mainPhoto" style="display:none;">
					<div>이름</div><input type="text" value="${memberVo.memberName}">
					<div id="checkPass"><a href="javascript:modifyPassword()">비밀번호 변경</a></div>
					<div id="pass" style="display:none">
						 비밀번호<input type="password"></br>
						 비밀번호 확인<input type="password">
					</div>
					<div><input type="submit" value="수정"></div>
				</form>
			</div>
		</div>
</body>
<script>
function squares(){
	$("#squaresStyle").html('<li><a href="javascript:squares();"><img src="/assets/img/button/squares.png"/></a></li>')
	$("#menuStyle").html('<li><a href="javascript:menu();"><img src="/assets/img/button/menugray.png"/></a></li>');
	$("#mapStyle").html('<li><a href="javascript:getMap();"><img src="/assets/img/button/mapgray.png"/></a></li>')
	$(".squares").show();
	$(".menuView").hide();
	$("#map").hide();
}
function menu(){
	$("#squaresStyle").html('<li><a href="javascript:squares();"><img src="/assets/img/button/squaresgray.png"/></a></li>')
	$("#menuStyle").html('<li><a href="javascript:menu();"><img src="/assets/img/button/menu.png"/></a></li>');
	$("#mapStyle").html('<li><a href="javascript:getMap();"><img src="/assets/img/button/mapgray.png"/></a></li>')
	$(".squares").hide();
	$(".menuView").show();
	$("#map").hide();
}
function getMap(){
	$("#squaresStyle").html('<li><a href="javascript:squares();"><img src="/assets/img/button/squaresgray.png"/></a></li>')
	$("#menuStyle").html('<li><a href="javascript:menu();"><img src="/assets/img/button/menugray.png"/></a></li>');
	$("#mapStyle").html('<li><a href="javascript:getMap();"><img src="/assets/img/button/map.png"/></a></li>')
	$(".squares").hide();
	$(".menuView").hide();
	$("#map").show();
	map.relayout();
	
}
function mainPhoto(){
	$("#mainPhoto").click();
}
function modifyPassword(){
	if (confirm('비밀번호를 변경하시겠습니까?')) {
		$("#pass").show();
		$("#checkPass").hide();
	} else {
		alert('취소되었습니다.');
		location.reload();
	}
} 
function viewFollowing(num){
	$("#followingList").toggle();
}
function viewFollower(num){
	$("#followerList").toggle();
}
function unFollow(following, follower){
	console.log(following);
	console.log(follower);
	if (confirm('언팔로우하시겠습니까??')) {
		location.href="/mycontent/unFollow?following="+following+"&follower="+follower+"&member_no="+${param.member_no};
	} else {
	}
}
function follow(following, follower){
	location.href="/mycontent/follow?following="+following+"&follower="+follower+"&member_no="+${param.member_no};
}
</script>
<script>
$(function(){
	 $('#modify').leanModal({ top: 110, overlay: 0.8, closeButton: ".hidemodal" });
})
</script>
<script>
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

</script>

</html>