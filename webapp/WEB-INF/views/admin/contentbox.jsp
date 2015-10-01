 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
	<tr>

		<td>
		<h1> ContentBox 등록</h1>
			<form action="/admin/insertcontentbox" method="post">
				<table border="1" >
					<tr>
					    <td bgcolor="#CCCCCC" align="center">플랜번호</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">플랜이름</td>
						<td bgcolor="#CCCCCC" align="center">등록</td>
					</tr>
					<tr>
					<td>
						<select name="plan_no">
							 <c:forEach var="vo" items="${planList}">
							  <option value="${vo.getPlan_no()}">${vo.getPlan_no()}</option>
							 </c:forEach>
					  </select> 
						</td>
						
					<td>
						<select name="content_no">
							 <c:forEach var="vo" items="${contentList}">
							  <option value="${vo.getContent_no()}">${vo.getContent_no()}</option>
							 </c:forEach>
					  </select> 
					</td>
						<td><input size="10" type="text" name="planName"></td>
						<td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
				<h1> ContentBox 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">플랜번호</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">플랜이름</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${contentBoxList}">
					<tr>
						<td>${vo.contentBox_no }</td>
						<td>${vo.plan_no }</td>
						<td>${vo.content_no }</td>
						<td>${vo.planName }</td>
						<td><a href="/admin/deletecontentbox?contentBox_no=${vo.contentBox_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>

	</tr>
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
	</script>