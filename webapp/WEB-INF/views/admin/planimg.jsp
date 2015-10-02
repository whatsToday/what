 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
	<tr>

		<td>
		<h1> PlanImg 등록</h1>
			<form action="/admin/insertplanimg" method="post" enctype="multipart/form-data">
				<table border="1" >
					<tr>
					    <td bgcolor="#CCCCCC" align="center">플랜번호</td>
						<td bgcolor="#CCCCCC" align="center">플랜이름</td>
						<td bgcolor="#CCCCCC" align="center">이미지</td>
						<td bgcolor="#CCCCCC" align="center">등록</td>
					</tr>
					<tr>
						<td>
						<select name="plan_no" onchange="changePlan(this.value)">
							 <c:forEach var="vo" items="${planList}">
							  <option value="${vo.getPlan_no()}">${vo.getPlan_no()}</option>
							 </c:forEach>
					  </select> 
							
						</td>
						<td><input size="10" type="text" id="planName" name="planName"></td>
					    <td><input type="file" name="img"></td>
						<td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
				<h1> PlanImg 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">플랜번호</td>
						<td bgcolor="#CCCCCC" align="center">플랜이름</td>
						<td bgcolor="#CCCCCC" align="center">이미지</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${planImgList}">
					<tr>
						<td>${vo.planImg_no }</td>
						<td>${vo.plan_no }</td>
						<td>${vo.planName }</td>
						<td><c:choose>
					   <c:when test="${not empty vo.imageUrl }">
				        <img src="${vo.imageUrl }" style="width:150px">
								</c:when>
								<c:otherwise>
								플랜 사진 없습니다.							
								</c:otherwise>
							</c:choose>
							</td>
						<td><a href="/admin/deleteplanimg?planImg_no=${vo.planImg_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>

	</tr>
<script type="text/javascript">
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
	