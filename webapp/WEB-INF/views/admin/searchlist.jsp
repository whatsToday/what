 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
	<tr>

		<td>
		<h1> SearchList 등록</h1>
			<form action="/admin/insertsearchlist" method="post" >
				<table border="1" >
					<tr>
					    <td bgcolor="#CCCCCC" align="center">회원번호</td>
						<td bgcolor="#CCCCCC" align="center">멤버이름</td>
						<td bgcolor="#CCCCCC" align="center">찾기</td>
						<td bgcolor="#CCCCCC" align="center">위도</td>
						<td bgcolor="#CCCCCC" align="center">경도</td>
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
						<td><input size="10" type="text" id=memberName name="memberName" readonly="readonly"></td>
						<td><input size="10" type="text" name="search"></td>
						<td><input size="10" type="text" name="latitude"></td>
						<td><input size="10" type="text" name="longitude"></td>
						<td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
				<h1> SearchList 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">회원번호</td>
						<td bgcolor="#CCCCCC" align="center">멤버이름</td>
						<td bgcolor="#CCCCCC" align="center">찾기</td>
						<td bgcolor="#CCCCCC" align="center">searchDate</td>
						<td bgcolor="#CCCCCC" align="center">위도</td>
						<td bgcolor="#CCCCCC" align="center">경도</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${searchList}">
					<tr>
						<td>${vo.searchList_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.memberName }</td>
						<td>${vo.search }</td>
						<td>${vo.searchDate}</td>
						<td>${vo.latitude }</td>
						<td>${vo.longitude }</td>
					    <td><a href="/admin/deletesearchlist?searchList_no=${vo.searchList_no }">삭제</a></td>
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