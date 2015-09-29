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
<div><h6>header</h6></div><!-- header will come here -->
<c:import url="/WEB-INF/views/main/modal.jsp"/>
<hr>
	<div class="container"><!-- 본문		 -->
<!-- 	위 아이콘 -->
			<div class="wsTable">
				<table>
					<tr>
<!-- 						<img alt="events" src=""><img alt="빨로빨로빨로뮈!" src="/assets/image/FFolome.png"><img alt="액뗌!액뗌!액뗌!" src=""> -->
						<td><button>이벤트</button></td>
						<td><button>팔로우</button></td>
						<td onclick="$('#picktheme').click();">테마 추가하기</td>
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
				                키워드 : <input type="text" value="${memberTheme.get(0).getThemeName()}" id="keyword" size="15"> 
				                <button type="submit">검색하기</button> 
				            </p>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>
<!-- 		테마 -->
				<div class="wsTable">
						<table>
							<tr>
<!-- 								<td style="color: #fb6f92" onclick="$('#picktheme').click();" onmouseover="changeColor(this)">테마 추가하기</td> -->
								<c:forEach var="vo" items="${memberTheme}" varStatus="status">
									<td id="theme_${status.index}" class="themeClass" onclick="themeSearch('${vo.themeName}')"
										onmouseover="changeColor(this)">${vo.themeName}</td>
								</c:forEach>
							</tr>
						</table>
				</div>
				<div class="wsTable">
					<table id="showPlan">
						<tr>
							<th class="wshd">
								<select id="plan_no" onchange="alert()">
								</select>
								일정
							</th>
						</tr>
					</table>
				</div>
	</div><!-- 	end container -->

<hr>
<div><h6>footer</h6></div><!-- 	 footer  will come here -->
</div><!-- end wrapper -->
</body>

<!-- script가 위에 있으면 안될때가 많다 js파일 다운로드 속도 땜에...-->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>
<script type="text/javascript" src="/assets/js/main/ws.js"></script>
<script type="text/javascript" src="/assets/js/main/map.js"></script>
<script>
//planlist부름
getMyPlan();
//plan_no 가져가서 content아래다가 뿌려야함.
// var sP =document.getElementById('showPlan');
// 			var abc = ['1','2','3','4','5'];
			
// 			for (var i = 0; i < abc.length; i++) {
// 				var planLi = document.createElement('tr');
// 				planStr ='<td>test'+i+'</td>';
				
// 				planLi.innerHTML = planStr;
				
// 				sP.appendChild(planLi);
// 			}
</script>
</html>