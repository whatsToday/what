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
				<ul><li class="soo">5</li><li class="top_menu">팔로잉</li><li><a href="javascript:viewFollowing()">팔로잉보기</a></li></ul>
				<ul><li class="soo">5</li><li class="top_menu">팔로워</li><li><a href="javascript:viewFollower()">팔로워보기</a></li></ul>
				<ul><li class="soo">5</li><li class="top_menu">게시물</li><li><a href="/board/addBoard">게시물쓰기</a></li></ul>
				<c:choose>
				<c:when test="${authUser.member_no == param.member_no}">
				<div class="pro_modi"><a href="javascript:modify();">프로필 편집</a></div>
				</c:when>
				<c:otherwise>
				<div class="pro_modi"><a href="javascript:follow();">팔로우하기</a></div>
				</c:otherwise>
				</c:choose>
				<div class="pro_name">${memberVo.memberName}</div>
				</div>
				<div class="menu">
					<ul>
						<li><a href="javascript:squares();"><img src="/assets/img/button/squares.png"/></a></li>
					</ul>
					<ul>
						<li><a href="javascript:menu();"><img src="/assets/img/button/menu.png"/></a></li>
					</ul>
					<ul>
						<li><a href="javascript:getMap();"><img src="/assets/img/button/map.png"/></a></li>
					</ul>
				</div>
				<div class="content">
				
				<ul id="squares">
				<c:forEach var="i" items="${planList}">
				<li><a href="/board?plan_no=${i.plan_no}"><img src="${i.titleImage}"/></a></li>
				</c:forEach>
				</ul> 
				
				<ul id="menuView">
				<c:forEach var="i" items="${planList}">
				<li>${i.planName}</li>
				<li><img src="${i.titleImage}"/></li>
				<li>${i.message}</li>
				<li>댓글</li>
				<li>댓글내용</li>
				</c:forEach>
				</ul>
				
				<div id="map"></div>
				
				</div>
				<div class="bottom"></div>
		</div>
	</div>
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
</body>
<script>
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
</script>
<script>
function squares(){
	$("#squares").show();
	$("#menuView").hide();
	$("#map").hide();
}
function menu(){
	$("#squares").hide();
	$("#menuView").show();
	$("#map").hide();
}
function getMap(){
	$("#squares").hide();
	$("#menuView").hide();
	$("#map").show();
}
</script>
</html>