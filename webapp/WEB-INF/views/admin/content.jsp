<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<!-- css -->
<link href="/assets/admin/css/bootstrap.min.css" rel="stylesheet" />
<link href="/assets/admin/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/assets/admin/css/jcarousel.css" rel="stylesheet" />
<link href="/assets/admin/css/flexslider.css" rel="stylesheet" />
<link href="/assets/admin/css/style.css" rel="stylesheet" />


<!-- Theme skin -->
<link href="/assets/admin/skins/default.css" rel="stylesheet" />

</head>
<body>
<div id="wrapper">
	<!-- start header -->
	<c:import url="/WEB-INF/views/admin/header.jsp"></c:import>
	<!-- end header -->
	<section id="featured">
	<!-- start slider -->

	
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
	<!-- Slider -->
         
		<h1> Content 등록</h1>
				<table border="1"  style="table-layout: fixed;" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">phone</td>
						<td bgcolor="#CCCCCC" align="center">newAddress</td>
						<td bgcolor="#CCCCCC" align="center">imageUrl</td>
						<td bgcolor="#CCCCCC" align="center">나침반</td>
						<td bgcolor="#CCCCCC" align="center">우편번호</td>
						<td bgcolor="#CCCCCC" align="center">웹주소</td>
						<td bgcolor="#CCCCCC" align="center">다음번호</td>
						<td bgcolor="#CCCCCC" align="center">상점이름</td>
						<td bgcolor="#CCCCCC" align="center">카테고리</td>
						<td bgcolor="#CCCCCC" align="center">주소</td>
						<td bgcolor="#CCCCCC" align="center">위도</td>
						<td bgcolor="#CCCCCC" align="center">경도</td>
						<td bgcolor="#CCCCCC" align="center">BCode</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertcontent" method="post" enctype="multipart/form-data">
			 <tr>					
						<td><input size="10" type="text" name="phone"></td>
						<td><input size="10" type="text" name="newAddress"></td>
						<td><input size="10" type="file" name="img"></td>
						<td><input size="10" type="text" name="direction"></td>
						<td><input size="10" type="text" name="zipcode"></td>
						<td><input size="10" type="text" name="placeUrl"></td>
						<td><input size="10" type="text" name="id"></td>
						<td><input size="10" type="text" name="title"></td>
						<td><input size="10" type="text" name="category"></td>
						<td><input size="10" type="text" name="address"></td>
						<td><input size="10" type="text" name="longitude"></td>
						<td><input size="10" type="text" name="latitude"></td>
						<td><input size="10" type="text" name="addressBCode"></td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> Content 조회</h1>
					<table class="selectVo" border="1" width="1392px" style="text-align:center" >
					<tr>
						<td bgcolor="#CCCCCC" align="center" style="width: 30px">No</td>
						<td bgcolor="#CCCCCC" align="center">phone</td>
						<td bgcolor="#CCCCCC" align="center">newAddress</td>
						<td bgcolor="#CCCCCC" align="center">imageUrl</td>
						<td width="60px"bgcolor="#CCCCCC" align="center">나침반</td>
						<td bgcolor="#CCCCCC" align="center">우편번호</td>
						<td bgcolor="#CCCCCC" align="center">웹주소</td>
						<td bgcolor="#CCCCCC" align="center">상점key</td>
						<td bgcolor="#CCCCCC" align="center">상점이름</td>
						<td bgcolor="#CCCCCC" align="center">카테고리</td>
						<td bgcolor="#CCCCCC" align="center">주소</td>
						<td bgcolor="#CCCCCC" align="center">위도</td>
						<td bgcolor="#CCCCCC" align="center">경도</td>
						<td bgcolor="#CCCCCC" align="center">BCode</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${contentList}">
					<tr>
						<td>${vo.content_no }</td>
						<td>${vo.phone }</td>
						<td>${vo.newAddress }</td>
								<td><c:choose>
								<c:when test="${not empty vo.imageUrl }">
				<img src="${vo.imageUrl }" style="width:150px">
								</c:when>
								<c:otherwise>
							 사진이 없습니다.								
								</c:otherwise>
							</c:choose>
						<td>${vo.direction }</td>
						<td>${vo.zipcode }</td>
						<td>${vo.placeUrl }</td>
						<td>${vo.id }</td>
						<td>${vo.title }</td>
						<td>${vo.category }</td>
						<td>${vo.address }</td>
						<td>${vo.longitude }</td>
						<td>${vo.latitude }</td>
						<td>${vo.addressBCode }</td>
						<td><a href="/admin/deletecontent?content_no=${vo.content_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
				<table >			
<tr>
   <td>
      <c:if test="${nowpage<=1}">
         [이전]&nbsp;
      </c:if>
      <c:if test="${nowpage>1}">
         <a href="/admin/content?page=${nowpage-1}">[이전]</a>&nbsp;
      </c:if>
      <c:forEach var="a" begin="${startpage}"  end="${endpage}">
             <c:if test="${a==nowpage}">
                <font color="red">[${a}]</font>
             </c:if>
             <c:if test="${a!=nowpage}">
                <a href="/admin/content?page=${a}">[${a}]</a>&nbsp;
             </c:if>    
      </c:forEach>
      <c:if test="${nowpage>=maxpage}">
           [다음]&nbsp;
      </c:if>
      <c:if test="${nowpage<maxpage}">
           <a href="/admin/content?page=${nowpage+1}">[다음]</a>
      </c:if>
   </td>
</tr>
</table>
	<!-- end slider -->
			</div>
		</div>
	</div>	
	
	
		<section class="callaction">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="big-cta">
					<div class="cta-text">
					
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	  

	</section>
		<section id="content">
	<div class="container">
		<div class="row">
	
		</div>
		<!-- divider -->
		<div class="row">
			<div class="col-lg-12">
				<div class="solidline">
				</div>
			</div>
		</div>
		<!-- end divider -->
		<!-- Portfolio Projects -->

   
      
	</div>
	</section>
	<c:import url="/WEB-INF/views/admin/footer.jsp"></c:import>
</div>


<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/assets/admin/js/jquery.js"></script>
<script src="/assets/admin/js/jquery.easing.1.3.js"></script>
<script src="/assets/admin/js/bootstrap.min.js"></script>
<script src="/assets/admin/js/jquery.fancybox.pack.js"></script>
<script src="/assets/admin/js/jquery.fancybox-media.js"></script>
<script src="/assets/admin/js/google-code-prettify/prettify.js"></script>
<script src="/assets/admin/js/portfolio/jquery.quicksand.js"></script>
<script src="/assets/admin/js/portfolio/setting.js"></script>
<script src="/assets/admin/js/jquery.flexslider.js"></script>
<script src="/assets/admin/js/animate.js"></script>
<script src="/assets/admin/js/custom.js"></script>
</body>
</html>