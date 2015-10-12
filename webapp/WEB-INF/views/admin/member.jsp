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
	<c:import url="/WEB-INF/views/admin/admin_header.jsp"></c:import>
	<!-- end header -->
	<section id="featured">
	<!-- start slider -->

	
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
	<!-- Slider -->
         
		<h1> Member 등록</h1>
				<table border="1" class="CSSTableGenerator" >
					<tr>
						<td>이름</td>
						<td>이메일</td>
						<td>패스워드</td>
						<td>imageUrl</td>
						<td>권한</td>
						<td><b>등록</b></td>
					</tr>
			<form id=insert action="/admin/insertmember" method="post" enctype="multipart/form-data">
					<tr>
						<td><input type="text" id="memberName"  name="memberName"></td>
						<td><input type="text" id="email" name="email"></td>
						<td><input type="password" id=password name="password"></td>
						<td><input type="file" name="img"></td>
						<td><select name="memberGrade">
							  <option value="Admin">Admin</option>
							  <option value="Guest">Guest</option>
							</select>						
						</td>
						<td><input type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> Member 조회</h1>
					<table class="CSSTableGenerator">
					<tr>
						<td>No</td>
						<td>이름</td>
						<td>이메일</td>
						<td>패스워드</td>
						<td>imageUrl</td>
						<td>권한</td>
						<td>삭제</td>
					</tr>
					<c:forEach var="vo" items="${memberList}">
					<tr>
						<td>${vo.member_no }</td>
						<td>${vo.memberName }</td>
						<td>${vo.email }</td>
						<td>${vo.password }</td>
						<td><c:choose>
								<c:when test="${not empty vo.imageUrl }">
				<img src="${vo.imageUrl }" width="150px" height="150px">
								</c:when>
								<c:otherwise>
								고객의 사진이 없습니다.								
								</c:otherwise>
							</c:choose>
						<td>${vo.memberGrade }</td>
						<td><a href="/admin/deletemember?member_no=${vo.member_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
				
		</td>
<table class="CSSTableGenerator" >			
<tr>
   <td>
      <c:if test="${nowpage<=1}">
         [이전]&nbsp;
      </c:if>
      <c:if test="${nowpage>1}">
         <a href="/admin/member?page=${nowpage-1}">[이전]</a>&nbsp;
      </c:if>
      <c:forEach var="a" begin="${startpage}"  end="${endpage}">
             <c:if test="${a==nowpage}">
                <font color="red">[${a}]</font>
             </c:if>
             <c:if test="${a!=nowpage}">
                <a href="/admin/member?page=${a}">[${a}]</a>&nbsp;
             </c:if>    
      </c:forEach>
      <c:if test="${nowpage>=maxpage}">
           [다음]&nbsp;
      </c:if>
      <c:if test="${nowpage<maxpage}">
           <a href="/admin/member?page=${nowpage+1}">[다음]</a>
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