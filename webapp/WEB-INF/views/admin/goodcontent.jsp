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
         
		<h1> GoodContent 등록</h1>
			<form action="/admin/insertgoodcontent" method="post">
				<table class="CSSTableGenerator">
					<tr>
						<td>타이틀</td>
						<td>멤버번호</td>
						<td>멤버이름</td>
					    <td>content_no</td>
						<td>등록</td>
					</tr>
					<tr>
					<td>
						<select name="title" onchange="changeContent(this.value)">
							 <c:forEach var="vo" items="${contentList}">
							  <option value="${vo.getTitle()}">${vo.getTitle()}</option>
							 </c:forEach>
					  </select> 
						</td>
						<td>
						<select name="member_no" onchange="changeEvent(this.value)">
							 <c:forEach var="vo" items="${memberList}">
							  <option value="${vo.getMember_no()}">${vo.getMember_no()}</option>
							 </c:forEach>
					  </select> 
							
						</td>
						<td><input size="10" type="text" id=memberName name="memberName" readonly="readonly"></td>
						<td><input size="10" type="text" id="content_no" name="content_no" readonly="readonly"></td>
						<td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
				<h1> GoodContent 조회</h1>
					<table class="CSSTableGenerator">
					<tr>
						<td>NO</td>
						<td>content_no</td>
						<td>멤버번호</td>
						<td>멤버이름</td>
						<td>타이틀</td>
						<td>삭제</td>
					</tr>
					<c:forEach var="vo" items="${goodContentList}">
					<tr>
						<td>${vo.goodContent_no }</td>
						<td>${vo.content_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.memberName }</td>
						<td>${vo.title }</td>
						<td><a href="/admin/deletegoodcontent?goodContent_no=${vo.goodContent_no }">삭제</a></td>
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
         <a href="/admin/goodcontent?page=${nowpage-1}">[이전]</a>&nbsp;
      </c:if>
      <c:forEach var="a" begin="${startpage}"  end="${endpage}">
             <c:if test="${a==nowpage}">
                <font color="red">[${a}]</font>
             </c:if>
             <c:if test="${a!=nowpage}">
                <a href="/admin/goodcontent?page=${a}">[${a}]</a>&nbsp;
             </c:if>    
      </c:forEach>
      <c:if test="${nowpage>=maxpage}">
           [다음]&nbsp;
      </c:if>
      <c:if test="${nowpage<maxpage}">
           <a href="/admin/goodcontent?page=${nowpage+1}">[다음]</a>
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
	    function changeContent(val){
	 	   $.ajax({
	 		   type :'get',
	 		   url  :'/admin/getcontent_no',
	 		   data :{
	 			   title:val
	 		   },
	 		   dataType:'json',
	 		   success:function(response){
	 			   $("#content_no").val(response.content_no);
	 		   }
	 	   })
	    }
	</script>
	
<script>
      function changeMember(val){
    	 $.ajax({
    		 type:'get',
    		 url :'/admin/getMemberName',
    		 data:{
    			 member_no : val
    		 },
    		 dataType : 'json',
    		 success  : function(response){
    			 $("#memberName").val(response.memberName);
    		 } 
    	 })
    	 
      }
      
      function changeFollow(val){
     	 $.ajax({
     		 type:'get',
     		 url :'/admin/getMemberName',
     		 data:{
     			followNum : val
     		 },
     		 dataType : 'json',
     		 success  : function(response){
     			 $("#followName").val(response.memberName);
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