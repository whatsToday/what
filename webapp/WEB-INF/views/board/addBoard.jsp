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
* { margin:0; padding:0;}
div {
		padding:10px;
}
div#container{
			   background-color : #ededed;
			   margin:7% 20%;
			   width: 50%;
			   height: 900px;
			   position: relative;
}
div#photo {
			float:left;
			width: 30%;
			height: 80px;
}
div#title {
			height: 80px;
			width: 65%;
			margin-left: 32%;
}
div#title input{
				margin-top:58px;
				width: 100%;
				height: 30px;
}
div#selectPlan{
				height: 50px;
}
div#selectPlan a{
				text-decoration: none;
				color:#000;
}

div#selectPlan ul#planList{
			display:none;
			list-style: none;
}

div#map{
			width: 96.5%;
			height: 350px;
}
div#message {
			width:96.5%;
			height: 300px;
}
div#message textarea {
			width:100%;
			height: 100%;
			resize:none;
}
div#submit{
			float:right;
}
</style>
</head>
<body>
<!-- header -->
<c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- container -->
<div id="container">
<div id="photo">사진<button onclick="upload()">사진선택</button><input type="file" id="uploadMainPhoto" style="display:none;"></div>
<div id="title"><input type="text" id="planName"></div>
<div id="selectPlan"><a href="javascript:showPlan();">플랜선택</a>
	<ul id="planList">
		<c:forEach var="i" items="${planList}">
		<li><a href="javascript:getPlan(${i.plan_no});">${i.planName}</a></li>
		</c:forEach>
	</ul>
</div>
<div id="map">Map</div>
<div id="message"><textarea id="msg"></textarea></div>
<div id="submit"></div>
</div>
<!-- footer -->
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
function showPlan(){
	$("#planList").toggle();
}
function upload(){
	$('#uploadMainPhoto').click();
}
function getPlan(plan_no){
	removeMarker();
	var lat;
	var lng;
	$.ajax({
		type : 'get',
	    url:'/board/getPlan',
	    data : {
	    	 plan_no : plan_no
	    },
	    dataType:'json',
	    success: function(response){
			for(var i=0; i<response.length; i++){
				lat = response[i].latitude;
				lng = response[i].longitude;
			    	markers[i] = new daum.maps.Marker({
						position : new daum.maps.LatLng(response[i].latitude ,response[i].longitude)
					});
					markers[i].setMap(map);
			    	}
			    	var moveLatLon = new daum.maps.LatLng(lat, lng);
					map.setCenter(moveLatLon);
					map.setLevel(2);
			}
	 })
	    $("#planList").hide();
		$("#submit").html('<button onclick="addPlan('+plan_no+');">등록</button>');
	
}
function addPlan(plan_no){
	var title = $("#planName").val();
	var message = $("#msg").val();
	var member_no;
	console.log(message);
	$.ajax({
		type : 'get',
	    url:'/board/addPlan',
	    data : {
	    	 title : title,
	    	 message : message,
	    	 plan_no : plan_no
	    },
	    dataType:'json',
	    success: function(response){
	    	member_no = response;
		 location.href="/mycontent?member_no="+member_no;
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
