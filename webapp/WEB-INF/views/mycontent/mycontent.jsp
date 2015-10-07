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
		<div class="mycontent" >
				<div class="top">
				<div class="pro"><img class="image_pro" src="${memberVo.imageUrl}"/></div>
				<ul><li class="soo">${followingList.size()}</li><li class="top_menu">팔로잉</li><li><a href='javascript:viewFollowing("${memberVo.member_no}")'>팔로잉보기</a><ul id="followingList"><c:forEach var="i" items="${followingList}"><a href="/mycontent?member_no=${i.followingNum}"><li><img src="${i.Url}"><span>${i.followingName}</span></li></a></c:forEach></ul></li></ul>
				<ul><li class="soo">${followerList.size()}</li><li class="top_menu">팔로워</li><li><a href='javascript:viewFollower("${memberVo.member_no}")'>팔로워보기</a><ul id="followerList"><c:forEach var="i" items="${followerList}"><a href="/mycontent?member_no=${i.followerNum}"><li><img src="${i.Url}">${i.followerName}</li></a></c:forEach></ul></li></ul>
				<ul><li class="soo">${planList.size()}</li><li class="top_menu">게시물</li><c:if test="${authUser.member_no == param.member_no }"><li><a href="/board/addBoard">게시물쓰기</a></li></c:if></ul>
				<c:choose>
				<c:when test="${authUser.member_no == param.member_no}">
				<div class="pro_modi"><a href="#modifyForm" id="modify">프로필 편집</a></div>
				</c:when>
				<c:when test="${not empty selectFollow}">
				<div class="pro_modi1"><a href="javascript:unFollow(${memberVo.member_no},${authUser.member_no});">팔로우 됨<img src="/assets/img/button/check.png"></a></div>
				</c:when>
				<c:when test="${empty selectFollow}">
				<div class="pro_modi"><a href="javascript:follow(${memberVo.member_no},${authUser.member_no});">팔로우하기</a></div>
				</c:when>
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
				<div class="menuView">
				<div id="menuTitleImage"><img id="titlePhoto" src="${i.titleImage}"/></div>
				<div id="menuContext">
				<div id="menuName">${i.planName}&nbsp&nbsp${i.plan_no}</div>
				<div id="menuMessage">${i.message}</div>
				<div id="menuPhoto">
				<c:forEach var="q" items="${planImgList}">
				<c:if test="${i.plan_no == q.plan_no}">
				<div id="menuImages"><a href="javascript:viewBigPhoto(${q.planImg_no})"><img id="photo${q.planImg_no}" src="${q.imageUrl}"></a></div>
				</c:if>
				</c:forEach>
				</div>
				<div id="menuComment"><span id="goods"><a>종아요</a></span>&nbsp&nbsp<span id="reply"><a>댓글</a></span></div>
				</div>
				</div>
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
	
	if("${planList.size()}" != 0){
		removeMarker();
		var lat;
		var lng;
		var id;

		$.ajax({
			type : 'get',
		    url:'/mycontent/allPlan',
		    data : {
		    	 member_no : "${param.member_no}"
		    },
		    dataType:'json',
		    success: function(response){
		    	for(var i=0; i<response.length; i++){
					lat = response[0].latitude;
					lng = response[0].longitude;
					console.log(lat + ":"+ lng);
					id = response[i].id;
				    markers[i] = new daum.maps.Marker({
							position : new daum.maps.LatLng(response[i].latitude ,response[i].longitude)
						});
		 		    markers[i].setMap(map);
		  			info(markers[i],id);
				    
				 }
		    	var moveLatLon = new daum.maps.LatLng(lat, lng);
		     	map.setCenter(moveLatLon);
				map.setLevel(8);
				console.log(map.getCenter());
			}
		})
		}
	
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
	if (confirm('언팔로우하시겠습니까??')) {
		location.href="/mycontent/unFollow?following="+following+"&follower="+follower+"&member_no="+${param.member_no};
	} else {
	}
}
function follow(following, follower){
	location.href="/mycontent/follow?following="+following+"&follower="+follower+"&member_no="+${param.member_no};
}
function viewBigPhoto(num){
	var titleImage = $('#titlePhoto').attr("src");
	var photo = $('#photo'+num).attr("src");
	$("#titlePhoto").attr("src" , photo);
	$("#photo"+num).attr("src" , titleImage);
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
<script>
function info(marker,id){
	$.ajax({
		type : 'get',
	    url:'/mycontent/getContent',
	    data : {
	    	id : id,
	    	member_no : "${param.member_no}"
	    },
	    dataType:'json',
	    success: function(response){
	    	 var title =response.title;
	    	 var imageUrl;
	    	 if(response.imageUrl ==null){
	    	 imageUrl = "/assets/img/noimg.png"; 
	    	 }
	    	 else{
	    	 imageUrl = response.imageUrl;
	    	 }
	    	 var phone = response.phone;
	    	 $.ajax({
	    			type : 'get',
	    		    url:'/mycontent/getContentPlan',
	    		    data : {
	    		    	id : id,
	    		    	member_no : "${param.member_no}"
	    		    },
	    		    dataType:'json',
	    		    success: function(response1){
	    		    	var plan_no = response1.plan_no;
	    		    	var iwContent = '<div id="info"><img src="'+imageUrl+'"><div><div id="tl">'+title+'</div></br>'+phone+'</br><div id="goToPlan"><a href="/board?plan_no='+plan_no+'">Go!</a></div></div></div>', 
	    		        iwRemoveable = true; 

	    		  		var infowindow = new daum.maps.InfoWindow({
	    		        content : iwContent,
	    		        removable : iwRemoveable
	    		    });

	    		    daum.maps.event.addListener(marker, 'click', function() {
	    		          // 마커 위에 인포윈도우를 표시합니다
	    		          infowindow.open(map, marker);  
	    		    });
	    				}
	    	});
	    	
			}
	})
}
</script>
<script>
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
</script>
</html>