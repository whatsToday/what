<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>키워드로 장소검색하고 목록으로 표출하기</title>
<link href="/assets/css/main/map.css" rel="stylesheet" />
<link href="/assets/css/main/ws.css" rel="stylesheet" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="/assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.leanModal.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrapper">
<c:import url="/WEB-INF/views/include/header.jsp"/>
<c:import url="/WEB-INF/views/main/modal.jsp"/>
	<div class="container"><!-- 본문		 -->
<!-- 	위 아이콘 -->
							<!-- 		테마 -->
			<div class="masthead">
								<div class="wsTable effect">
										<table>
											<tr>
												<td class="wshd" onclick="$('#picktheme').click();">테마 추가하기</td>
											</tr>
										</table>
										<table>
											<tr>
												<c:forEach var="vo" items="${memberTheme}" varStatus="status">
													<td id="theme_${status.index}" class="themeClass" onclick="themeSearch('${vo.themeName}'); markTheme(this);">${vo.themeName}</td>
												</c:forEach>
											</tr>
										</table>
								</div>
			</div>					
			
				
			<div class="jumbotron">
							<!-- 			지도 -->
							<div class="map_wrap">
								    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
								    <div id="menu_wrap" class="bg_white">
								        <div class="option">
								        		<table>
								        			<tr>
								        				<td onclick="searchPlaces(); return false;">
								                			<button class="wsButton">전국 검색</button> 
								        				</td>
								        				<td onclick="searchPlaces2(); return false;">
								                			<button id="areaSearch" class="wsButton">주변 검색</button> 
								        				</td>
								        			</tr>
								        			<tr>
								        				<td colspan="2"><input type="text" placeholder="오늘 뭐하지?" id="keyword" size="15"></td>
								        			</tr>
								        		</table>
											    
								        </div>
								        <hr>
								        <ul id="placesList"></ul>
								        <div id="pagination"></div>
								    </div>
								</div>
							<!-- 				후기글 -->
								<div class="wsTable effect">
									<table>
										<tr>
											<td id="showAll" class="even" onclick="themeSearch(this.id);">추천 후기</td>
											<td id="otherLoc" class="even" onclick="changeLocation(); placesNear();">Circle 위치 변경</td>
										</tr>
									</table>
								</div>
				</div>

<!-- row				 -->
				<div class="row-fluid">
					<div class="span12">				
								<div class="wsTable">
									<table id="showPlan">
										<tr>
											<th class="wshd">
												<select id="plan_no" onchange="callContents(this.value);"></select>
											</th>
										</tr>
									</table>
								</div>
								<div class="wsTable effect">
									<table>
										<tr>
											<td class="wshd" onclick="createPlan();">새 일정 추가하기</td>
											<td class="wshd" onclick="deletePlan();">일정 삭제하기</td>
										</tr>
									</table>
								</div>
					</div>
									<div id="showHot"  class="span4 wsTable"></div>
									<div id="showHotToday"  class="span4 wsTable"></div>
									<div id="TodayIssue"  class="span4 wsTable"><table><tr><td>gdgd</td></tr></table></div>
				</div>
	</div><!-- 	end container -->
<c:import url="/WEB-INF/views/include/footer.jsp"/>
</div><!-- end wrapper -->

</body>
<!-- script가 위에 있으면 안될때가 많다 js파일 다운로드 속도 땜에...-->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c12b4d88c8259cf4652b89c1f64db8e8&libraries=services"></script>
<script type="text/javascript" src="/assets/js/main/ws.js"></script>
<script type="text/javascript" src="/assets/js/main/map.js"></script>
<script>

//planlist부름
getMyPlan();

//memberTheme 없으면 띄워드립니다.
var $mT = ${memberTheme.size()};
if($mT==0){
$('#picktheme').click();
}
//이미 등록된 테마는 check 표시해줌
checkThemeBox();

//enterkey 누르면 주변검색
$("#keyword").keyup(function (e) {
    if (e.keyCode == 13) {
    	$("#areaSearch").click();
    }
});


</script>
 <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/assets/bootstrap/js/bootstrap-transition.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-alert.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-modal.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-dropdown.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-scrollspy.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-tab.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-tooltip.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-popover.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-button.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-collapse.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-carousel.js"></script>
    <script src="/assets/bootstrap/js/bootstrap-typeahead.js"></script>
</html>