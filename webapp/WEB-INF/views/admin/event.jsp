 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
	<tr>

		<td>
		<h1> Event 등록</h1>
			<form action="/admin/insertevent" method="post" >
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">상점이름</td>
					    <td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">메세지</td>
						<td bgcolor="#CCCCCC" align="center">시작일</td>
						<td bgcolor="#CCCCCC" align="center">종료일</td>
						<td bgcolor="#CCCCCC" align="center">eventStatus</td>
						<td bgcolor="#CCCCCC" align="center">등록</td>
					</tr>
					<tr>
						<td>
						<select name="title" onchange="changeEvent(this.value)">
							 <c:forEach var="vo" items="${contentList}">
							  <option value="${vo.getTitle()}">${vo.getTitle()}</option>
							 </c:forEach>
					  </select> 
							
						</td>
					    <td><input size="10" type="text" id="content_no" name="content_no" readonly="readonly"></td>
						<td><input size="10" type="text" name="message"></td>
						<td><input type="Date" name="regDate"></td>
						<td><input type="Date" name="dueDate"></td>
						<td><input size="10" type="text" name="eventStatus"></td>
						<td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
				<h1> Event 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">상점이름</td>
						<td bgcolor="#CCCCCC" align="center">메세지</td>
						<td bgcolor="#CCCCCC" align="center">시작일</td>
						<td bgcolor="#CCCCCC" align="center">종료일</td>
						<td bgcolor="#CCCCCC" align="center">eventStatus</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${eventList}">
					<tr>
						<td>${vo.event_no }</td>
						<td>${vo.content_no }</td>
						<td>${vo.title }</td>
						<td>${vo.message }</td>
						<td>${vo.regDate }</td>
						<td>${vo.dueDate }</td>
						<td>${vo.eventStatus }</td>
						<td><a href="/admin/deleteevent?event_no=${vo.event_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>

	</tr>
	<script>
	    function changeEvent(val){
	    	$.ajax({
				type : 'get',
			    url:'/admin/getcontent_no',
			    data : {
			    	 title : val
			    },
			    dataType:'json',
			    success: function(response){
			    	$("#content_no").val(response.content_no);
			    } 
			 })
	    } 
	</script>