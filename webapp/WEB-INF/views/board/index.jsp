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
div#photo img{
			width: 100%;
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
div#message textarea {
			width:100%;
			height: 100%;
			resize:none;
}
div#submit{
			float:right;
}
</style>
</head>
<body>
<!-- header -->
<c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- container -->
<div id="container">
<div id="photo"><img src="${planBoard.titleImage}"/></div>
<div id="title">${planBoard.planName}</div>
<div id="map">Map</div>
<div id="message"><textarea id="msg" readonly="readonly">${planBoard.message}</textarea></div>
<div id="comment">댓글</div>
<div>댓글내용</div>
</div>
<!-- footer -->
</body>
</html>