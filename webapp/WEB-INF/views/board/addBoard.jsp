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
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>
<script type="text/javascript"
	src="/assets/js/board/jquery-1.9.1.min.js"></script>
<!-- css -->
<style type="text/css">
div.container {
	margin-top: 5%;
	border: 1px solid #000;
	width: 1000px;
}

div#photo {
	margin-top: 20px;
	width: 150px;
	height: 150px;
	float: left;
	border: 1px solid #000;
	border-radius: 150px;
}

div#photo img {
	width: 100%;
	height: 100%;
	border-radius: 150px;
}

div#title {
	margin-top: 80px;
	margin-left: 200px;
	width: 700px;
	border: 1px solid #000;
	height: 30px;
}

div#title strong {
	background-color: #69ABED;
	font-size: 50px;
}

div#title input[type=text] {
	width: 698px;
	height: 28px;
	font-size: 15px;
	line-height: 28px;
}

#planName::-webkit-input-placeholder, #msg::-webkit-input-placeholder {
	color: #69ABED;
}

div#selectPlan {
	margin-top: 20px;
	margin-left: 200px;
	border: 1px solid #69ABED;;
	width: 200px;
	height: 30px;
	line-height: 30px;
	background-color: #69ABED;
}

div#selectPlan a {
	margin-left: 5px;
	text-decoration: none;
	font-size: 15px;
	font-weight: bold;
	color: #fff;
}

div#map {
	margin-top: 20px;
	margin-left: 200px;
	border: 1px solid #000;
	width: 700px;
	height: 400px;
	z-index: 0;
}

div#submit input[type=submit] {
	margin-right: 80px;
	margin-bottom: 20px;
	border: 1px solid #69ABED;
	float: right;
	padding: 15px;
	background-color: #69ABED;
	font-weight: bold;
	color: #fff;
}

div#selectPlan ul {
	z-index: 5;
	position: relative;
	list-style: none;
	background-color: #ededed;
	margin-top: 10px;
	width: 200px;
	overflow-x: hidden;
	overflow-y: scroll;
	height: 100px;
	display: none;
}

div#selectPlan ul li {
	margin: 10px;
}

div#selectPlan ul li a {
	text-decoration: none;
	color: #000;
}

div#message {
	margin-top: 20px;
	margin-left: 200px;
	width: 700px;
	height: 200px;
	border: 1px solid #000;
}

div.container textarea {
	width: 100%;
	height: 100%;
	resize: none;
}

div#contentPhoto {
	border: 1px solid #000;
	padding: 10px;
}

span:hover {
	cursor: pointer;
}

div#msgPhoto {
	margin-top: 20px;
	height: 50px;
	width: 700px;
	margin-left: 200px;
	padding: 10px;
}

div#msgPhoto a {
	border: 1px solid #69ABED;
	padding: 15px;
	background-color: #69ABED;
	text-decoration: none;
	font-weight: bold;
	color: #fff;
}

div#info {
	padding: 5px;
	width: 250px;
	height: 122px;
	font-size: 12px;
}

div#info img {
	border: 1px solid #000;
	width: 100px;
	height: 111px;
	float: left;
	margin-right: 10px;
}

div#info div#tl {
	width: 120px;
	margin-left: 110px;
	height: 25px;
	line-height: 25px;
	font-size: 95%;
	font-weight: bold;
	text-align: center;
	color: #69ABED
}

div#info div#delContent {
	border: 1px solid #69ABED;
	background-color: #69ABED;
	margin-top: 20px;
	margin-right: -3px;
	float: right;
	width: 50px;
	height: 40px;
}

div#info div#delContent a {
	margin-left: 10px;
	text-decoration: none;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	line-height: 40px;
}

div#photoList {
	width: 700px;
	margin-top: 20px;
	margin-left: 200px;
	margin-bottom: 20px;
}
div.viewPhoto {
	background-color: #ededed;
	width: 700px;
	height:100px;
	margin-top: 20px;
}

div.viewImages {
	margin-left: 10px;
	float: left;
	border: 1px solid #000;
	width: 100px;
	height: 100px;
}

div.viewImages img {
	width: 100px;
	height: 100px;
}

div.viewImagesName {
	padding: 10px;
	margin-top: 20px;
	margin-left: 50px;
	float: left;
	border: 1px solid #000;
	width: 325px;
	height: 70px;
	line-height: 70px;
}

div.viewImagesModify {
	float: left;
	margin-top: 20px;
	margin-left: 50px;
	border: 1px solid #69ABED;
	background-color: #69ABED;
	width: 70px;
	height: 70px;
	color: #fff;
	line-height: 70px;
	text-align: center;
}

div.viewImagesDelete {
	float: right;
	margin-top: 20px;
	margin-right: 10px;
	border: 1px solid #69ABED;
	background-color: #69ABED;
	width: 70px;
	height: 70px;
	color: #fff;
	line-height: 70px;
	text-align: center;
}

div.viewImagesModify a, div.viewImagesDelete a {
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}
</style>
</head>
<body>
	<!-- header -->
	<div id="wrapper">
		<c:import url="/WEB-INF/views/include/header.jsp" />
		<!-- container -->
		<div class="container">
			<form id="addForm" method="post" enctype="multipart/form-data" action="/board/addPlan">
				<input type="hidden" id="plan_no" name="plan_no" value="">
				<div id="photo">
					<a href="javascript:upload(1)"><img id="mainPhoto"
						src="/assets/img/noimage.jpg"></a><input type="file"
						name="titleImage" id="uploadMainPhoto" style="display: none;">
				</div>
				<div id="title">
					<input type="text" name="planName" id="planName"
						placeholder="제목을 입력하세요.">
				</div>
				<div id="selectPlan">
					<a href="javascript:showPlan();">플랜선택</a>
					<ul id="planList">
						<c:forEach var="i" items="${planList}" varStatus="status">
							<li><a href="javascript:getPlan(${i.plan_no});">${status.count}번째
									플랜</a></li>
						</c:forEach>
					</ul>
				</div>
				<div id="map">Map</div>
				<div id="message">
					<textarea name="msg" id="msg" placeholder="내용을 입락하세요."></textarea>
				</div>
				<div id="msgPhoto">
					<a id="selectPhoto" href="javascript:upload(2)">사진선택</a><input type="file" name="img1" id="uploadPhoto1" style="display: none">
					</div>
				<div id="photoList"></div>
				
				<div id="submit"></div>
			</form>
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
var countImages=1;
function readURL(input,num) {
if(num==1){
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#mainPhoto').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
	}
if(num==2){
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#viewImage1').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    	}
	}
if(num==3){
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#viewImage'+countImages).attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    	}
	}	
}
$("#uploadMainPhoto").change(function(){
    readURL(this,1);
});
function showPlan(){
	$("#planList").toggle();
}
function upload(num){
	if(num==1){
		$('#uploadMainPhoto').click();
	}
	if(num==2){
		console.log(countImages)
		if(countImages==1){
			$('#uploadPhoto').click();
			$("#uploadPhoto").change(function(){
				 $("#viewPhoto").show();
				    readURL(this,2);
					var pt =$('#uploadPhoto').val();
					var pht = pt.split("fakepath")[1];
					var photo = pht.substring(1,pht.length)
					var data = '<div class="viewPhoto"><div class="viewImages" id="viewImages1"><img id="viewImage" src=""></div><div class="viewImagesName" id="viewImagesName1">'+photo+'</div><div class="viewImagesModify" id="viewImagesModify1"><a>바꾸기</a></div><div class="viewImagesDelete" id="viewImagesDelete1"><a>삭제</a></div></div>';
					$("#photoList").append(data);
				})
		} 
		if(countImages>10){
			$("#selectPhoto").hide();
			alert("사진은 9개만 등록 가능합니다.")	
		}
		if(countImages <=10 && countImages > 1){
			console.log(countImages)
			console.log("!")
			$('#msgPhoto').append('<input type="file" name="img'+countImages+'" id="uploadPhoto'+countImages+'" style="display:none">');
			
			 $('#uploadPhoto'+countImages).click();
				 $('#uploadPhoto'+countImages).change(function(){
				    readURL(this,3);
					var pt =$(this).val();
					var pht = pt.split("fakepath")[1];
					var photo =pht.substring(1,pht.length)
					var data = '<div class="viewPhoto"><div class="viewImages" id="viewImages'+countImages+'"><img id="viewImage'+countImages+'" src=""></div><div class="viewImagesName" id="viewImagesName'+countImages+'">'+photo+'</div><div class="viewImagesModify" id="viewImagesModify'+countImages+'"><a>바꾸기</a></div><div class="viewImagesDelete" id="viewImagesDelete'+countImages+'"><a>삭제</a></div></div>';
					$("#photoList").append(data);
					}) 
		}
		countImages ++;
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
	    		alert("이 플랜에 정보가 없습니다!");
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
					map.setLevel(5);
						 $("#planList").hide();
						$("#submit").html('<input type="submit" value="등록">');
						$("#plan_no").val(plan_no);
	    	}
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
