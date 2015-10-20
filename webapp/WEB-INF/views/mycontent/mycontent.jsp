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
				<ul><li class="soo">${followingList.size()}</li><li class="top_menu">팔로잉</li><li><a href='javascript:viewFollowing("${memberVo.member_no}")'>팔로잉보기</a><ul id="followingList"><c:forEach var="i" items="${followingList}"><a href="/mycontent?member_no=${i.followingNum}"><li><img src="${i.Url}"><div>${i.followingName}</div></li></a></c:forEach></ul></li></ul>
				<ul><li class="soo">${followerList.size()}</li><li class="top_menu">팔로워</li><li><a href='javascript:viewFollower("${memberVo.member_no}")'>팔로워보기</a><ul id="followerList"><c:forEach var="i" items="${followerList}"><a href="/mycontent?member_no=${i.followerNum}"><li><img src="${i.Url}"><div>${i.followerName}</div></li></a></c:forEach></ul></li></ul>
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
				<div id="menuTitleImage"><img id="titlePhoto${i.plan_no}" src="${i.titleImage}"/></div>
				<div id="menuContext">
				<div id="menuName">${i.planName}</div>
				<div id="menuMessage">${i.message}</div>
				<div id="menuPhoto">
				<c:forEach var="q" items="${planImgList}">
				<c:if test="${i.plan_no == q.plan_no}">
				<div id="menuImages"><a href="javascript:viewBigPhoto(${q.planImg_no},${q.plan_no})"><img id="photo${q.planImg_no}" src="${q.imageUrl}"></a></div>
				</c:if>
				</c:forEach>
				</div>
				<div id="menuComment"><span id="goods"><a href="javascript:goods(${i.plan_no})">종아요[<span id="goodCount${i.plan_no}">${i.goodCount}</span>]</a></span>&nbsp&nbsp<span id="reply"><a href="javascript:viewCommentsList(${i.plan_no})">댓글[${i.commentsCount}]</a></span></div>
				<div class="menuComments" id="menuComments${i.plan_no}">
					<div id="viewCommentsList">
					<c:forEach var="k" items="${planComments}">
					<c:if test="${i.plan_no == k.plan_no}">
					<div id="viewComments">
						<div id="commentsPhotoV"><img src="${k.imageUrl}"></div>
						<div id="commentsNameV"><a href="/mycontent?member_no=${k.member_no}">${k.memberName}</a></div>
						<div id="commentsMessageV">${k.message}</div>
						<div id="commentsRegDate">${k.regDate}</div>
						<div id="replyFn"><c:if test="${k.replyCount!=0}"><span><a href="javascript:viewReplyList(${k.planComments_no})">답글보기[${k.replyCount}]</a></span>&nbsp&nbsp</c:if><span><a href="javascript:writeReply(${k.planComments_no})">답글달기</a></span><c:if test="${k.member_no==authUser.member_no}">&nbsp&nbsp<span><a href="javascript:deleteComments(${k.planComments_no},${k.plan_no})">삭제</a></span></c:if></div>
							
							<div class="commentsReply" id="commentsReply${k.planComments_no}">
								<div id="viewReplyList">
								<div id="viewReply">
									<div id="replyPhotoV"><img src="${k.imageUrl}"></div>
									<div class="replyNameV"><a id="replyNameV${k.planComments_no}" href="/mycontent?member_no=${k.member_no}">${k.memberName}</a></div>
									<div id="replyMessageV">${k.message}</div>
									<div id="replyRegDate">${k.regDate}</div>
									<div id="replyReplyFn"><span><a href="javascript:insertReReply(${k.planComments_no})">답글달기</a></span><c:if test="${k.member_no==authUser.member_no}">&nbsp&nbsp<span><a href="javascript:deleteReply(${k.planComments_no},${k.plan_no})">삭제</a></span></c:if></div>								</div>
							</div>
								<div id="writeReply">
									<div id="replyUserW">
										<div id="replyPhotoW"><img src="${authUser.imageUrl}"></div>
										<div id="replyNameW">${authUser.memberName}</div>
									</div>
									<div id="replyContentsW">
										<div id="replyMessageW"><input type="text" id="relyMessageW${k.planComments_no}" placeholder="답글 입력"></div>
										<div id="replyWriteButton"><a href="javascript:insertReply(${k.planComments_no},${param.member_no})"><img src="/assets/img/button/write.png"></a></div>
									</div>
								</div>
							</div>
							
					</div>
					</c:if>
					</c:forEach>
					</div>
					<div id="writeComments">
						<div id="commentsUserW">
							<div id="commentsPhotoW"><img src="${authUser.imageUrl}"></div>
							<div id="commentsNameW">${authUser.memberName}</div>
						</div>
						<div id="commentsContentsW">
							<div id="commentsMessageW"><input type="text" id="commentsMessageW${i.plan_no}" placeholder="댓글 입력"></div>
							<div id="writeButton"><a href="javascript:insertComments(${i.plan_no})"><img src="/assets/img/button/write.png"></a></div>
						</div>
					</div>
					</div>
				</div>
				</div>
				</c:forEach>
				<div id="map" style="display:none"></div>
				</div>
				<div class="bottom"></div>
		</div>
	</div>
	</div>
	<div id="modifyForm" >
				<div id="modify">
				<div id="modifyTitle">My Profile</div>
				<form id="modifyF"method="post" action="/mycontent/modify" enctype="multipart/form-data">
					<div id="modifyImage"><img id="myPhoto" src="${memberVo.imageUrl}"></div>
					<a id="modifyPhoto" href="javascript:mainPhoto()">Photo</a><input type="file" name="mainPhoto" id="mainPhoto" style="display:none;">
					<div id="modifyContent">
					<div id="modifyName">이름<input type="text" name="memberName" value="${memberVo.memberName}"></div>
					<div id="checkPass"><a href="javascript:modifyPassword()">비밀번호 변경</a></div>
					<div id="pass">
						 비밀번호<input id="password" name="password" type="password"></br>
						 비밀번호 확인<input id="checkPassword" type="password">
					</div>
					<div><input type="submit" value="수정"></div>
					</div>
				</form>
			</div>
		</div>
</body>
<script>
$(function(){
	$("#modifyF").submit(function(){
		var password = $("#password").val();
		var checkPassword = $("#checkPassword").val();
		if(password != checkPassword){
			alert("비밀번호가 일치하지않습니다.");
			return false;
		}
	})
})
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
	    		var countNum = $("#goodCount"+num).html();
	    		if(response == countNum){
	    			alert("이미 좋아요를 누르셨습니다.")
	    		}
	    		$("#goodCount"+num).html(response)
	   		 }
	    });
}
function viewCommentsList(plan_no){
	$("#menuComments"+plan_no).toggle();
}
function viewReplyList(planComments_no){
	$("#commentsReply"+planComments_no).toggle();
}
function insertComments(num){
	var message = $("#commentsMessageW"+num).val();
	location.href="/mycontent/insertComments?plan_no="+num+"&message="+message+"&member_no="+${param.member_no};
	}
function deleteComments(num,num1){
	
	if (confirm('댓글을 삭제하시겠습니까?')) {
		location.href="/mycontent/deleteComments?planComments_no="+num+"&plan_no="+num1+"&member_no="+${param.member_no};
	} else {
		alert('취소되었습니다.');
		location.reload();
	}
}
function writeReply(planComments_no){
		$("#commentsReply"+planComments_no).toggle();
}
function insertReReply(num){
	var message= $("#replyNameV"+num).html();
	$("#relyMessageW"+num).val(message+" ");
}
function insertReply(num, member_no){
	var message= $("#relyMessageW"+num).val();
	location.href="/mycontent/insertReply?planComments_no="+num+"&message="+message+"&member_no="+member_no;
}
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
	$("#mainPhoto").change(function(){
		readURL(this);
	})
}
function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#myPhoto').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    	}
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
function viewBigPhoto(num,num1){
	var titleImage = $('#titlePhoto'+num1).attr("src");
	var photo = $('#photo'+num).attr("src");
	$("#titlePhoto"+num1).attr("src" , photo);
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