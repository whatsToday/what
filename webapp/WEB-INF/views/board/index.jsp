<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘 뭐하지?</title>
<!-- script -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
<!-- css -->
<style type="text/css">
div.container{
			margin-top : 5%;
			border: 1px solid #000;
			width:1000px;
}
div#photo {
			margin-top:20px;
			width: 150px;
			height: 150px;
			float:left;
			border: 1px solid #000;
			border-radius:150px;
}
div#photo img{
				width:100%;
				height:100%;
				border-radius:150px;
}
div#title {	
			margin-top:80px;
			margin-left: 200px;	
			width:700px;
			border: 1px solid #000;
			height:  30px;
}
div#title strong{
			 background-color: #69ABED;
			 font-size : 50px;
}
div#title input[type=text] {
				width:698px;
				height:28px;
				font-size:15px;
				line-height: 28px;
				
}
#planName::-webkit-input-placeholder,#msg::-webkit-input-placeholder { color:#69ABED; }
div#selectPlan{
			margin-top:20px;
			margin-left: 200px;	
			border: 1px solid #69ABED;
			width:200px;
			height: 30px;
			line-height: 30px;
			background-color:#69ABED;
}
div#selectPlan a{
			margin-left: 5px;
			text-decoration: none;
			font-size:15px;
			font-weight: bold;
			color:#fff;
}
div#map {
		margin-top:20px;
		margin-left: 200px;
		border: 1px solid #000;
		width:700px;
		height: 400px;
		z-index: 0;
}
div#cmtWrite, div#cmtView{
		border:1px solid #000;
		border-bottom:none;
		margin-top:10px;
		margin-left:auto;
		margin-right:auto;
		width: 1000px;
		height :40px;
		line-height:40px;
		text-align:center;
		background-color:#69ABED;
		color:#fff;

}
div#comment{
		margin-left:auto;
		margin-right:auto;
		width: 1000px;
}
div#comment div#viewComment{
		border: 1px solid #000;
		height: 40px;
}
div#comment div#writeComment{
		border: 1px solid #000;
		height: 60px;
}
div#comment div#writeComment button{
		height: 58px;
		width:68px;
		margin-top:-58px;
		float: right;
 		border: 1px solid #69ABED;
 		padding : 5px;
 		background-color:#69ABED;
		font-weight: bold;
		color:#fff;
}
div#comment div#writeComment div#userName{
		margin-left:10px;
		height: 60px;
		line-height:60px;
		width: 150px;
		font-size:16px;
		font-weight: bold;
}
div#comment div#writeComment div#userName img{
				width:45px;
				height:45px;
				border-radius:45px;
}
div#comment div#writeComment div#userName span{
				margin-left:20px;
}
div#comment div#writeComment div#commentText{
			border-left:1px solid #000;
			margin-top:-60px;
			margin-left:150px;
			width: 847px;
			height: 58px;
}
div#comment div#writeComment div#commentText textarea{
			width: 780px;
			height: 58px;
}
div#comment div#viewComment div#userName{
		margin-left:10px;
		height: 40px;
		line-height:30px;
		padding:3px;
		width: 150px;
		font-size:16px;
		font-weight: bold;
}
div#comment div#viewComment div#userName img{
				width:30px;
				height:30px;
				border-radius:30px;
}
div#comment div#viewComment div#userName span{
				margin-left:20px;
}
div#comment div#viewComment div#commentText{
			border-left:1px solid #000;
			margin-top:-40px;
			margin-left:150px;
			width: 847px;
			height: 38px;
}
div#submit{
		margin-left:auto;
		margin-right:auto;
		width: 1000px;
}
div#submit button{
			margin-top:10px;
			margin-left:20px;
			margin-bottom:20px;
 			border: 1px solid #69ABED;
 			float : right;
 			padding : 15px;
 			background-color:#69ABED;
			font-weight: bold;
			color:#fff;
 			
 }
div#selectPlan ul{
		z-index: 5;
		position: relative;
		list-style: none;
		background-color: #ededed;
		margin-top:10px;
		width: 200px;
		overflow-x:hidden;
		overflow-y: scroll;
		height: 100px;
		display:none;
}
div#selectPlan ul li{
						margin:10px;
						
}
div#selectPlan ul li a{
						text-decoration: none;
						color:#000;
}
div#message {
				margin-top:20px;
				margin-left:200px;
				width:700px;
				height: 200px;
				border: 1px solid #000;
}
div.container textarea{
					width:100%;
					height: 100%;
					resize:none;
					
}
div#contentPhoto{
				border: 1px solid #000;
				padding:10px;
}
div#msgPhoto {
			margin-left:180px;
}
div#images{
			border: 1px solid #000;
			margin-top:20px;
			margin-left: 20px;
			margin-bottom:20px;
			width: 220px;
			height: 220px;
			float : left;
}
div#info{padding: 5px; width:250px; height: 122px; font-size:12px; }
div#info img{border:1px solid #000; width: 100px; height: 111px;  float:left; margin-right:10px;}
div#info div#tl{width:120px; margin-left:110px;height: 25px; line-height: 25px; font-size: 95%; font-weight: bold; text-align: center; color:#69ABED}
div#info div#goToPlan {	
			border: 1px solid #69ABED;
			background-color:#69ABED;
			margin-top:20px;
			margin-right:-3px;
			float:right;
			width: 50px;
			height: 40px;
}
</style>
</head>
<body>
<!-- header -->
<div id="wrapper">
<c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- container -->
<div class="container">
<div id="photo"><img src="${planBoard.titleImage}"></div>
<div id="title">${planBoard.planName}</div>
<div id="map"></div>
<div id="message">${planBoard.message}</div>
<div id="msgPhoto"><div id="images">포토</div></div>
</div>
<div id="comment">
<div id="cmtWrite">댓글쓰기</div>
<div id="writeComment"><div id="userName"><img src="${authUser.imageUrl}"><span>${authUser.memberName}</span></div><div id="commentText"><textarea></textarea></div><button>댓글달기</button></div>
<div id="cmtView">댓글보기</div>
<div id="viewComment"><div id="userName"><a href="/mycontent?member_no="><img src="${authUser.imageUrl}"><span>${authUser.memberName}</span></a></div><div id="commentText"></div></div>
</div>
<c:if test="${authUser.member_no==planBoard.member_no}">
<div id="submit"><button onclick="modifyPlan(${planBoard.plan_no},${planBoard.member_no});">수정</button><button onclick="deletePlan(${planBoard.plan_no},${planBoard.member_no});">삭제</button></div>
</c:if>
<!-- footer -->
</div>
</body>
<script>
function modifyPlan(){
	
}
function deletePlan(plan_no,member_no){
	if (confirm('이 플랜을 삭제하시겠습니까?')) {
		location.href="/board/deletePlan?plan_no="+plan_no+"&member_no="+member_no;
	} else {
		alert('취소되었습니다.');
		location.reload();
	}
}
</script>
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
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
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
	         var iwContent = '<div id="info"><img src="'+imageUrl+'"><div><div id="tl">'+title+'</div></br>'+phone+'</br></div></div>', 
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
</script>
<script>
removeMarker();
var lat;
var lng;
var id;
$.ajax({
	type : 'get',
    url:'/board/getPlan',
    data : {
    	 plan_no : "${param.plan_no}"
    },
    dataType:'json',
    success: function(response){
		for(var i=0; i<response.length; i++){
			lat = response[i].latitude;
			lng = response[i].longitude;
			id = response[i].id;
		    	markers[i] = new daum.maps.Marker({
					position : new daum.maps.LatLng(response[i].latitude ,response[i].longitude)
				});
				markers[i].setMap(map);
				info(markers[i],id);
		    	}
		    	var moveLatLon = new daum.maps.LatLng(lat, lng);
				map.setCenter(moveLatLon);
				map.setLevel(5);
		}
 })
</script>
</html>
