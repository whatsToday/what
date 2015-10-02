 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
	<tr>

		<td>
		<h1> GoodPlan 등록</h1>
			<form action="/admin/insertgoodplan" method="post">
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">멤버번호</td>
					    <td bgcolor="#CCCCCC" align="center">플랜번호</td>
						<td bgcolor="#CCCCCC" align="center">멤버이름</td>
						<td bgcolor="#CCCCCC" align="center">플랜이름</td>
						<td bgcolor="#CCCCCC" align="center">등록</td>
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
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">플랜번호</td>
						<td bgcolor="#CCCCCC" align="center">멤버번호</td>
						<td bgcolor="#CCCCCC" align="center">멤버이름</td>
						<td bgcolor="#CCCCCC" align="center">플랜이름</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${goodPlanList}">
					<tr>
						<td>${vo.goodPlan_no }</td>
						<td>${vo.plan_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.memberName }</td>
						<td>${vo.planName }</td>
						<td><a href="/admin/deletegoodplan?goodplan_no=${vo.goodPlan_no }">삭제</a></td>
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