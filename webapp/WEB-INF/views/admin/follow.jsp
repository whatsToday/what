<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
	<tr>
		<td>
		<h1> Follow 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center">followNum</td>
						<td bgcolor="#CCCCCC" align="center">memberName</td>
						<td bgcolor="#CCCCCC" align="center">followName</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
					
			<form action="/admin/insertfollow" method="post">
					<tr>
						<td>
							<select name="member_no" onchange="changeMember(this.value)">
							 <c:forEach var="vo" items="${memberList}">
							  <option value="${vo.getMember_no()}">${vo.getMember_no()}</option>
							 </c:forEach>
							</select>
						</td>
					<td>
						   	<select name="followNum" onchange="changeFollow(this.value)">
				          
							 <c:forEach var="vo" items="${memberList}">
							  <option id="vlaue" value="${vo.getMember_no()}">${vo.getMember_no()}</option>
							
							 </c:forEach>
			           
							</select>
					</td>
					<td>
						   <input size="10" type="text" id="memberName" name="memberName" readonly="readonly">
				     </td>
					
						<td>
						   <input size="10" type="text" id="followName" name="followName" readonly="readonly">
						</td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> follow 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center">followNum</td>
						<td bgcolor="#CCCCCC" align="center">memberName</td>
						<td bgcolor="#CCCCCC" align="center">followName</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${followList}">
					<tr>
						<td>${vo.follow_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.followNum }</td>
						<td>${vo.memberName }</td>
						<td>${vo.followName }</td>
						<td><a href="/admin/deletefollow?follow_no=${vo.follow_no}">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>
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
				