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
			border: 1px solid #69ABED;;
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
div#submit button{
			margin-right: 80px;
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
span:hover{
			cursor: pointer;
}
div#msgPhoto .msgPt{
			margin : 20px 20px 20px 200px;
 			border: 1px solid #69ABED;
 			padding : 15px;
 			background-color:#69ABED;
			font-weight: bold;
			color:#fff;
}
div#info{padding: 5px; width:250px; height: 122px; font-size:12px; }
div#info img{border:1px solid #000; width: 100px; height: 111px;  float:left; margin-right:10px;}
div#info div#tl{width:120px; margin-left:110px;height: 25px; line-height: 25px; font-size: 95%; font-weight: bold; text-align: center; color:#69ABED}
div#info div#delContent {	
			border: 1px solid #69ABED;
			background-color:#69ABED;
			margin-top:20px;
			margin-right:-3px;
			float:right;
			width: 50px;
			height: 40px;
}
div#info div#delContent a{
			margin-left:10px;
		 	text-decoration: none;
		 	color:#fff;
		 	font-size:15px;
		 	font-weight:bold;
		 	line-height: 40px;
}	
</style>
</head>
<body>
<!-- header -->
<div id="wrapper">
<c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- container -->
<div class="container">
<div id="photo"><a href="javascript:upload(1)"><img src="/assets/img/noimage.jpg"></a><input type="file" name="img" id="uploadMainPhoto" style="display:none;"></div>
<div id="title"><input type="text" id="planName" placeholder="제목을 입력하세요."></div>
<div id="selectPlan"><a href="javascript:showPlan();">플랜선택</a>
	<ul id="planList">
		<c:forEach var="i" items="${planList}" varStatus="status">
		<li><a href="javascript:getPlan(${i.plan_no});">${status.count}번째 플랜</a></li>
		</c:forEach>
	</ul>
</div>
<div id="map">Map</div>
<div id="message"><textarea id="msg" placeholder="내용을 입락하세요."></textarea></div>
<div id="msgPhoto"><button class="msgPt" onclick="upload(2)">사진선택</button><input type="file" name="img1" id="uploadPhoto" style="display:none;"><a href="javascript:testss()">+</a></div>
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
function info(marker,id){
	$.ajax({
		type : 'get',
	    url:'/mycontent/getContent',
	    data : {
	    	id : id,
	    	member_no : "${authUser.member_no}"
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
	    	 var content_no = response.content_no;
	    	 var phone = response.phone;
	    	 $.ajax({
	    			type : 'get',
	    		    url:'/mycontent/getContentPlan',
	    		    data : {
	    		    	id : id,
	    		    	member_no : "${authUser.member_no}"
	    		    },
	    		    dataType:'json',
	    		    success: function(response1){
	    		    	var plan_no = response1.plan_no;
	    		    	var iwContent = '<div id="info"><img src="'+imageUrl+'"><div><div id="tl">'+title+'</div></br>'+phone+'</br><div id="delContent"><a href="javascript:deleteContent('+content_no+','+plan_no+')">삭제</a></div></div></div>', 
	    		        iwRemoveable = true; 

	    		  		var infowindow = new daum.maps.InfoWindow({
	    		        content : iwContent,
	    		        removable : iwRemoveable
	    		    });

	    		    daum.maps.event.addListener(marker, 'click', function() {
	    		          // 마커 위에 인포윈도우를 표시합니다
	    		          infowindow.open(map, marker);  
	    		    });
	    		    daum.maps.event.addListener(map, 'click', function() {
	    		    	 infowindow.close();  
	    		    });
	    				}
	    	});
	    	
			}
	})
}
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
	var id;
	$.ajax({
		type : 'get',
	    url:'/board/getPlan',
	    data : {
	    	 plan_no : plan_no
	    },
	    dataType:'json',
	    success: function(response){
	    	if(response.length==0){
	    		alert("이 플랜에 정보가 없습니다!")
	    	}if(response.length!=0){
	    		
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
					map.setLevel(2);
	    	}
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
function deleteContent(content_no, plan_no){
	removeMarker();
	var lat;
	var lng;
	var id;
	 $.ajax({
		type : 'get',
	    url:'/board/deleteContent',
	    data : {
	    	 content_no : content_no,
	    	 plan_no : plan_no,
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
					map.setLevel(2);
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
<script>
</script>
</html>
