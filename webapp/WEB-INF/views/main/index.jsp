<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하고 목록으로 표출하기</title>
<link href="/assets/css/main/map.css" rel="stylesheet" />
<link href="/assets/css/main/ws.css" rel="stylesheet" />

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.leanModal.min.js"></script>
</head>
<body>
<div id="wrapper">
<c:import url="/WEB-INF/views/include/header.jsp"/>
<c:import url="/WEB-INF/views/main/modal.jsp"/>
	<div class="container"><!-- 본문		 -->
	<hr>
<!-- 	위 아이콘 -->
			<div class="wsTable effect">
				<table>
					<tr>
						<td id="showAll" class="even" onclick="themeSearch('showAll');">후기글만 보기</td>
						<td class="even">팔로우</td>
						<td id="otherLoc" class="even" onclick="changeLocation(); placesNear();">현재 위치로 내 위치 설정</td>
						<td id="userLoc" class="even" onclick="navigator.geolocation.getCurrentPosition(success, error, options);">내 위치 </td>
						<td class="even" onclick="$('#picktheme').click();">테마 추가하기</td>
					</tr>
				</table>
			</div>
<!-- 			지도 -->
			<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <p>
				                <form onsubmit="searchPlaces(); return false;"> 
							                키워드 : <input type="text" value="" placeholder="오늘 뭐하지?" id="keyword" size="15">
				                <button type="submit">검색하기</button> 
				            </p>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>
<!-- 		테마 -->
				<div class="wsTable effect">
						<table>
							<tr>
								<c:forEach var="vo" items="${memberTheme}" varStatus="status">
									<td id="theme_${status.index}" class="themeClass even" onclick="themeSearch('${vo.themeName}')">${vo.themeName}</td>
								</c:forEach>
							</tr>
						</table>
				</div>
				<div class="wsTable">
					<table id="showPlan">
						<tr>
							<th class="wshd">
								<select id="plan_no" onchange="callContents(this.value);"></select>
							</th>
						</tr>
					</table>
				</div>
				<hr>
	</div><!-- 	end container -->
<c:import url="/WEB-INF/views/include/footer.jsp"/>
</div><!-- end wrapper -->
</body>
<!-- script가 위에 있으면 안될때가 많다 js파일 다운로드 속도 땜에...-->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>
<script type="text/javascript" src="/assets/js/main/ws.js"></script>
<script type="text/javascript" src="/assets/js/main/map.js"></script>
<script>
var nearOn = false;
var myLoc =false;
function checkOnOff(){
		var sa = document.getElementById('showAll');
		var ua = document.getElementById('userLoc');
		var oa = document.getElementById('otherLoc');
		
	if(nearOn){
		sa.style.backgroundColor="#69ABED";
	}else{
		sa.style.backgroundColor="#fff";
	}
	
// 	if(myLoc){
// 		ua.style.backgroundColor="#69ABED";
// 		oa.style.backgroundColor="#fff";
// 	}else{
// 		oa.style.backgroundColor="#69ABED";
// 		ua.style.backgroundColor="#fff";
// 	}
	
	
}

//planlist부름
getMyPlan();

//memberTheme 없으면 띄워드립니다.
var $mT = ${memberTheme.size()};
if($mT==0){
$('#picktheme').click();
}
//이미 등록된 테마는 check 표시해줌
checkThemeBox();
</script>
</html>