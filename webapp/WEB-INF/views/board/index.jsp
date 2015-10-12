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
div#wrapper{
			position:absolute;
}
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
div#goods{
			width:80px;
			height: 30px;
			margin-top: 70px;
			margin-left: 820px;
			position: absolute;
}
div#viewGoods{
			width:80px;
			height: 30px;
			margin-top: 100px;
			margin-left: 820px;
			position: absolute;
			font-size:16px;
			font-weight: bold;
			text-align: center;
			padding: 5px;
}
div#goods img{
			width:100%;
			height:100%;
}
div#title {	
			margin-top:80px;
			margin-left: 200px;	
			width:700px;
			height:  30px;
			font-size:30px;
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
		height: 70px;
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
}
div#comment div#viewComment div#userName a{
		text-decoration: none;
		font-size:16px;
		font-weight: bold;
		color:#000;
}
div#comment div#viewComment div#userName a:hover{
		color:#69ABED;
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
			line-height:38px;
			width: 800px;
			height: 68px;
}
div#comment div#viewComment div#commentText span#pMessage{
			margin-left:10px;
}
div#comment div#viewComment div#commentText span#pRegDate{
			float: right;
}
div#comment div#viewComment div#commentText span#viewComments, div#comment div#viewComment div#commentText span#writeComments{
			margin-left:5px;
			font-size:11px;
			color: #69ABED;
}
div#comment div#viewComment div#commentText span#viewComments a, div#comment div#viewComment div#commentText span#writeComments a{
			text-decoration: none;
}
div#comment div#viewComment div#deleteComments{
			margin-top:-32px;
			float:right;
			margin-right:20px;
 			width: 20px;
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
div.images{
			border: 1px solid #000;
			margin-top:20px;
			margin-left: 20px;
			margin-bottom:20px;
			width: 220px;
			height: 220px;
			float : left;
}
div.images img{
			width: 100%;
			height: 100%;
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
div#modalPhoto{
		display:none;
		width: 500px;
		height: 500px;
		position:absolute;
		z-index:99999;
		box-shadow:  rgba(0,0,0,0.8) 0 0 0 9999px;
}
div#modalPhoto img{
		width:100%;
		height: 100%;
}
div.commentsReply{
		background-color: #ededed;
		margin-top:3px;
		margin-left:150px;
		width: 400px;
		max-height: 500px;
		display:none;
		position: absolute;
		box-shadow:  rgba(0,0,0,0.8) 0 0 0 9999px;
}
div#viewReplyList{
		position: relative;
		margin-left:10px;
		
}
div.commentsReply div.viewReply{
		border: 1px solid #000;
		width:370px;
		height:55px;
		margin-bottom:2px;
		margin-left:5px;
		float: left;
}
div.commentsReply div.viewReply div.replyPhotoV{
		float:left;
		width:50px;
		height:50px;
}
div.commentsReply div.viewReply div.replyName{
		float:left;
		width:60px;
		height:20px;
		margin-left:5px;
		font-size:16px;
		font-weight:bold;
		color:#69ABED;
}
div.commentsReply div.viewReply div.replyMessage{
		float:left;
		width:210px;
		height:20px;
}
div.commentsReply div.viewReply div.replyRegDate{
		float:left;
		width:40px;
		height:20px;
		font-size:11px;
		color:#9e9e9e;
}
div.commentsReply div.viewReply div.replyPhotoV img{
		width:100%;
		height: 100%;
}
div.commentsReply div#writeReply{
		padding:10px;
		height:30px;
}
div.commentsReply div#writeReply input[type=text]{
		margin-left:8px;
		width: 83%;
		height:20px;
}
div.commentsReply div#writeReply div#writeButton{
		float:right;
}
div.commentsReply div#writeReply div#replyPhotoW{
		width: 40px;
		height: 40px;
		float: left;
}
div.commentsReply div#writeReply div#replyPhotoW img{
		width: 100%;
		height: 100%;
}
div.commentsReply div#replyButton{
		margin-top:1px;
		margin-right:1px;
		float:right;
		position: relative;
}
div.replyFn{
		margin-top:30px;
		margin-left:60px;
		height: 20px;
		}
div.replyFn span{
		margin-right: 10px;
		}		
div.replyFn a{
		font-size:10px;
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
<div id="goods"><a href="javascript:goods(${param.plan_no});"><img src="/assets/img/like.jpg"></a></div>
<div id="viewGoods">${countGood}</div>
<div id="title">${planBoard.planName}</div>
<div id="map"></div>
<div id="message">${planBoard.message}</div>
<div id="msgPhoto">
<c:forEach var="i" items="${planImg}"><div class="images"><a href="javascript:viewBigImage(${i.planImg_no})"><img id="msgPhoto${i.planImg_no}" src="${i.imageUrl}"></a></div></c:forEach>
</div>
</div>
<div id="comment">
<div id="cmtWrite">댓글쓰기</div>
<div id="writeComment"><div id="userName"><img src="${authUser.imageUrl}"><span>${authUser.memberName}</span></div><div id="commentText"><textarea id="commentsMessage" name="commentsMessage"></textarea></div><button onclick="insertComments(${param.plan_no})">댓글달기</button></div>
<div id="cmtView">댓글보기</div>
<c:forEach var="q" items="${planComments}">
<div id="viewComment"><div id="userName"><a href="/mycontent?member_no=${q.member_no}"><img src="${q.imageUrl}"><span>${q.memberName}</span></a></div><div id="commentText"><span id="pMessage">${q.message}</span><span id="pRegDate">${q.regDate}</span></br><c:if test="${not empty planReply}"><span id="viewComments"><a href="javascript:viewPlanReply(${q.planComments_no})">답글보기</a></span></c:if><span id="writeComments"><a href="javascript:writePlanReply(${q.planComments_no})">답글쓰기</a></span></div>
<c:if test="${authUser.member_no==q.member_no}">
<div id="deleteComments"><a href="javascript:deleteComments(${q.planComments_no},${param.plan_no})"><img src="/assets/img/button/trash.png"></a></div>
<div class="commentsReply" id="commentsReply${q.planComments_no}">
	<div id="replyButton"><a href="javascript:closeReply(${q.planComments_no})"><img src="/assets/img/button/x.png"></a></div>
	<div id="viewReplyList">
	<c:forEach var="k" items="${planReply}">
	<c:if test="${q.planComments_no == k.planComments_no}">
	<div class="viewReply"><div class="replyPhotoV"><img src="${k.imageUrl}"></div><div class="replyName">${k.memberName}</div><div class="replyMessage">${k.message}</div><div class="replyRegDate">${k.regDate}</div><div class="replyFn"><span><a>답글달기</a></span><span><a>삭제</a></span></div></div>
	</c:if>
	</c:forEach>
	</div>
	<div id="writeReply"><div id="replyPhotoW"><img src="${authUser.imageUrl}"></div><span><input id="replyMessage${q.planComments_no}" type="text" placeholder="답글달기"></span><div id="writeButton"><a href="javascript:writeReply(${q.planComments_no})"><img src="/assets/img/button/write.png"></a></div></div>
	</div>
</c:if>
</div>
</c:forEach>
</div>
<c:if test="${authUser.member_no==planBoard.member_no}">
<div id="submit">
	<button onclick="modifyPlan(${planBoard.plan_no},${planBoard.member_no})">수정</button>
	<button onclick="deletePlan(${planBoard.plan_no},${planBoard.member_no})">삭제</button>
</div>
</c:if>
<!-- footer -->
</div>
<div id="modalPhoto">
</div>
</body>
<script>
$(function(){
	$("body").click(function(){
		$('#modalPhoto').hide();
	});
})
function insertComments(num){
		var message = $("#commentsMessage").val();
		location.href="/board/insertComments?plan_no="+num+"&message="+message;
		}
function deleteComments(num,num1){
		location.href="/board/deleteComments?planComments_no="+num+"&plan_no="+num1;
}
function viewPlanReply(num){
	$("#commentsReply"+num).toggle();
}
function writePlanReply(num){
	$("#commentsReply"+num).toggle();
}
function writeReply(num){
	var message= $("#replyMessage"+num).val();
	console.log(message)
	location.href="/board/insertReply?planComments_no="+num+"&message="+message+"&plan_no="+${param.plan_no};
}
function closeReply(num){
	$("#commentsReply"+num).hide();
}
function viewBigImage(num){
	
	var imageUrl = $("#msgPhoto"+num).attr("src");
	  $('#modalPhoto').html("<img src="+imageUrl+">")
	  $('#modalPhoto').show();
	  $('#modalPhoto').css("top", Math.max(0, (($(window).height() - $('#modalPhoto').outerHeight()) / 2) + $(window).scrollTop()) + "px");
	  $('#modalPhoto').css("left", Math.max(0, (($(window).width() - $('#modalPhoto').outerWidth()) / 2) + $(window).scrollLeft()) + "px");
}
function deletePlan(plan_no,member_no){
	if (confirm('이 플랜을 삭제하시겠습니까?')) {
		location.href="/board/deletePlan?plan_no="+plan_no+"&member_no="+member_no;
	} else {
		alert('취소되었습니다.');
		location.reload();
	}
}
function goods(num){
	$.ajax({
		type : 'get',
	    url:'/board/goodPlan',
	    data : {
	    	plan_no : num,
	    	member_no : "${authUser.member_no}"
	    },
	    dataType:'json',
	    success: function(response){
	    		var countNum = $("#viewGoods").html();
	    		if(response == countNum){
	    			alert("이미 좋아요를 누르셨습니다.")
	    		}
	    		$("#viewGoods").html(response)
	   		 }
	    });
	
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
