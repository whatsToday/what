<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
	<tr>
		<td>
		<h1> Comments 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">회원이름</td>
						<td bgcolor="#CCCCCC" align="center">메세지</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertcomments" method="post" >
						 <tr>					
						<td>
						    <select name="member_no" onchange="changeEvent(this.value)">
						         <c:forEach var="vo" items="${memberList }">
						         <option value="${vo.getMember_no() }">${vo.getMember_no() }</option> 
						         </c:forEach>
    						</select> 
    					</td>
    					<td>
    					    <select name="content_no">
    					       <c:forEach var="vo" items="${contentList }">
    					         <option value="${vo.getContent_no() }">${vo.getContent_no() }</option>
    					       </c:forEach>
    					    </select>
    					</td>
						<td><input size="10" type="text" id=memberName name="memberName" readonly="readonly"></td>
						<td><input size="10" type="text" name="message"></td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> Comments 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">comments_no</td>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center">content_no</td>
						<td bgcolor="#CCCCCC" align="center">memberName</td>
						<td bgcolor="#CCCCCC" align="center">message</td>
						<td bgcolor="#CCCCCC" align="center">regDage</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${commentsList}">
					<tr>
						<td>${vo.comments_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.content_no }</td>
     					<td>${vo.memberName }</td>
						<td>${vo.message }</td>
						<td>${vo.regDate }</td>
						<td><a href="/admin/deletecomments?comments_no=${vo.comments_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>

<script type="text/javascript">
   function changeEvent(val){
	   $.ajax({
		   type :'get',
		   url  :'/admin/getMemberName',
		   data :{
			   member_no:val
		   },
		   dataType:'json',
		   success:function(response){
			   $("#memberName").val(response.memberName);
		   }
	   })
   }
   
   
</script>
				