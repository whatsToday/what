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
div#submit{
			float:right;
}
</style>
</head>
<body>
<!-- header -->
<!-- container -->
<div id="container">
<div id="photo">사진</div>
<div id="title"><input type="text" id="title"></div>
<div id="selectPlan"><a href="javascript:showPlan();">플랜선택</a>
	<ul id="planList">
		<li>1
		</li>
	</ul>
</div>
<div id="map">Map</div>
<div id="message">message</div>
<div id="submit">등록</div>
</div>
<!-- footer -->
</body>
<script>
function showPlan(){
	$("#planList").toggle();
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
</html>
