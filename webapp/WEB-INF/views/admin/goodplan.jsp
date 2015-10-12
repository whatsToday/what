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
         
		<h1> GoodPlan 등록</h1>
			<form action="/admin/insertgoodplan" method="post">
				<table class="CSSTableGenerator">
					<tr>
						<td>멤버번호</td>
					    <td>플랜번호</td>
						<td>멤버이름</td>
						<td>플랜이름</td>
						<td>등록</td>
					</tr>
					<tr>
						<td>
						<select name="member_no" onchange="changeEvent(this.value)">
							 <c:forEach var="vo" items="${memberList}">
							  <option value="${vo.getMember_no()}">${vo.getMember_no()}</option>
							<%--   <option value="${vo.getMember_no()}">${vo.getMemberName()}</option> --%>
							 </c:forEach>
					  </select> 
							
						</td>
							<td>
						<select name="plan_no" onchange="changePlan(this.value)">
							 <c:forEach var="vo" items="${planList}">
							  <option value="${vo.getPlan_no()}">${vo.getPlan_no()}</option>
							 </c:forEach>
					  </select> 
						</td>
						<td><input size="10" type="text" id="memberName" name="memberName" readonly="readonly"></td>
						<td><input size="10" type="text" id="planName" name="planName" readonly="readonly"></td>
						<td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
				<h1> GoodPlan 조회</h1>
					<table class="CSSTableGenerator">
					<tr>
						<td>NO</td>
						<td>플랜번호</td>
						<td>멤버번호</td>
						<td>멤버이름</td>
						<td>플랜이름</td>
						<td>삭제</td>
					</tr>
					<c:forEach var="vo" items="${goodPlanList}">
					<tr>
						<td>${vo.goodPlan_no }</td>
						<td>${vo.plan_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.memberName }</td>
						<td>${vo.planName }</td>
						<td><a href="/admin/deletegoodplan?goodPlan_no=${vo.goodPlan_no }">삭제</a></td>
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
         <a href="/admin/goodplan?page=${nowpage-1}">[이전]</a>&nbsp;
      </c:if>
      <c:forEach var="a" begin="${startpage}"  end="${endpage}">
             <c:if test="${a==nowpage}">
                <font color="red">[${a}]</font>
             </c:if>
             <c:if test="${a!=nowpage}">
                <a href="/admin/goodplan?page=${a}">[${a}]</a>&nbsp;
             </c:if>    
      </c:forEach>
      <c:if test="${nowpage>=maxpage}">
           [다음]&nbsp;
      </c:if>
      <c:if test="${nowpage<maxpage}">
           <a href="/admin/goodplan?page=${nowpage+1}">[다음]</a>
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
	<script>
	    function changeEvent(val){
	    	$.ajax({
				type : 'get',
			    url:'/admin/getMemberName',
			    data : {
			    	 member_no : val
			    },
			    dataType:'json',
			    success: function(response){
			    	$("#memberName").val(response.memberName);
			    } 
			 })
	    } 
	    
	    function changePlan(val){
	    	$.ajax({
				type : 'get',
			    url:'/admin/getplanname',
			    data : {
			    	 plan_no : val
			    },
			    dataType:'json',
			    success: function(response){
			    	$("#planName").val(response.planName);
			    } 
			 })
	    } 
	</script>
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