<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!--css -->
<link href="/assets/css/common.css" rel="stylesheet" type="text/css" />
<link href="/assets/css/mycontent.css" rel="stylesheet" type="text/css" />


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘 뭐하지?</title>
</head>
<body>
	<div id="wrapper">
		<c:import url="/WEB-INF/views/include/header.jsp"/> 
	<div class="container">
			<div class="omu"><img src="/assets/img/omu.jpg"></div>
		<div class="mycontent" >
			<div class="top">
			<c:choose>
				<c:when test="${empty authUser }">
				<div class="pro"><img class="image_pro" src="/assets/img/no_img.jpg"/></div>
				<ul><li class="soo">5</li><li class="top_menu">팔로잉</li><li>팔로잉보기</li></ul>
				<ul><li class="soo">5</li><li class="top_menu">팔로워</li><li>팔로워보기</li></ul>
				<ul><li class="soo">5</li><li class="top_menu">게시물</li><li>게시물편집</li></ul>
				<div class="pro_modi">프로필 편집</div>
				<div class="pro_name">박성국</div>
				
				<div class="menu">
					<ul>
						<li>메뉴4</li>
					</ul>
					<ul>
						<li>메뉴3</li>
					</ul>
					<ul>
						<li>메뉴2</li>
					</ul>
					<ul>
						<li>메뉴1</li>
					</ul>
				</div>
				<div class="content"></div>
				<div class="bottom"></div>
				</c:when>
				<c:otherwise>
				
				
				</c:otherwise>
			</c:choose>

			</div>
		</div>
	</div>

		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
</body>
</html>