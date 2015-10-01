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
}
div#board{
			margin : 3% 17% 0% 17%;
			width:65%;
			background-color: #ddd;
			position: relative;
}
div#photo {
			width: 20%;
			height: 40px;
			float:left;
			border: 1px solid #000;
}
div#photo img{
				max-width:100%;
				max-height:100%;
				margin-left: 33%;
}
div#title {	
			border: 1px solid #000;
			height: 40px;
}
div#title input[type=text] {
				width:79.2%;
				height:20px;
				margin-top: 8px;
				
}
div#selectPlan{
			border: 1px solid #000;
			height: 30px;
}
div#selectPlan a#select{
			border: 1px solid #000;
			background-color: #fff;
			text-decoration: none;
			color:#000;
			padding:0 150px;
}
div#map {
		border: 1px solid #000;
		height: 400px;
		z-index: 0;
}
div#submit{
		border: 1px solid #000;
}
div#submit button{
 			border: 1px solid #000;
 			float : right;
 			background-color: #fdfdfd;
 			padding : 15px;
 			
 }
div#selectPlan ul{
		z-index: 5;
		position: relative;
		list-style: none;
		background-color: #ededed;
		margin-top:10px;
		width: 365px;
		overflow-x:hidden;
		overflow-y: scroll;
		height: 100px;
}
div#selectPlan ul li{
						margin:10px;
}
div#selectPlan ul li a{
						text-decoration: none;
						color:#000;
}
div#message {
				height: 200px;
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
span:hover{
			cursor: pointer;
}		
</style>
</head>
<body>
<!-- header -->
<div id="wrapper">
<c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- container -->
<div class="container">
<div id="photo">사진<button onclick="upload(1)">사진선택</button><input type="file" name="img" id="uploadMainPhoto" style="display:none;"></div>
<div id="title"><input type="text" id="planName"></div>
<div id="selectPlan"><a href="javascript:showPlan();">플랜선택</a>
	<ul id="planList">
		<c:forEach var="i" items="${planList}" varStatus="status">
		<li><a href="javascript:getPlan(${i.plan_no});">${status.count}번째 플랜</a></li>
		</c:forEach>
	</ul>
</div>
<div id="map">Map</div>
<div id="message"><textarea id="msg"></textarea></div>
<div id="msgPhoto"><button onclick="upload(2)">사진선택</button><input type="file" name="img1" id="uploadPhoto" style="display:none;"><a href="javascript:testss()">+</a></div>
<div id="submit"></div>
</div>
<!-- footer -->
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
function testss(){
	$("#msgPhoto").append('<button onclick="upload(2)">사진선택</button><input type="file" name="img1" id="uploadPhoto" style="display:none;"><a href="javascript:testss()">+</a>');
}
function showPlan(){
	$("#planList").toggle();
}
function upload(num){
	if(num==1){
		$('#uploadMainPhoto').click();
	}
	if(num==2){
		$('#uploadPhoto').click();	
	}
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
	 
	$.ajax({
		type : 'get',
	    url:'/board/addPlan',
	    data : {
	    	 title : title,
	    	 message : message,
	    	 plan_no : plan_no,
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
