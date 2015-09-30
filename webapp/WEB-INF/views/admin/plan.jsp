<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<tr>

		<td>
		<h1> Plan 등록</h1>
			<form action="/admin/insertplan" method="post" enctype="multipart/form-data">
				<table border="1" >
					<tr>
					    <td bgcolor="#CCCCCC" align="center">멤버이름</td>
						<td bgcolor="#CCCCCC" align="center">플랜이름</td>
						<td bgcolor="#CCCCCC" align="center">메세지</td>
						<td bgcolor="#CCCCCC" align="center">플랜 날짜</td>
						<td bgcolor="#CCCCCC" align="center">타이틀이미지</td>
					</tr>
					<tr>
						<td>
						<select name="member_no">
							 <c:forEach var="vo" items="${memberList}">
							  <option value="${vo.getMember_no()}">${vo.getMemberName()}</option>
							 </c:forEach>
					  </select> 
							
						</td>
						<td><input size="10" type="text" name="planName"></td>
						<td><input size="10" type="text" name="message"></td>
						<td><input type="Date" name="planDate"></td>
					    <td><input type="file" name="img"></td>
						<td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form>
				<h1> Plan 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">회원번호</td>
						<td bgcolor="#CCCCCC" align="center">플랜이름</td>
						<td bgcolor="#CCCCCC" align="center">멤버이름</td>
						<td bgcolor="#CCCCCC" align="center">메세지</td>
						<td bgcolor="#CCCCCC" align="center">플랜 날짜</td>
						<td bgcolor="#CCCCCC" align="center">타이틀이미지</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${planList}">
					<tr>
						<td>${vo.plan_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.planName }</td>
						<td>${vo.memberName }</td>
						<td>${vo.message }</td>
						<td>${vo.planDate }</td>
						<%-- <td><img src="${vo.titleImage }" style="width:150px"></td> --%>
						<td><c:choose>
								<c:when test="${not empty vo.titleImage }">
				<img src="${vo.titleImage }" style="width:150px">
								</c:when>
								<c:otherwise>
								플랜 사진 없습니다.							
								</c:otherwise>
							</c:choose>
						<td><a href="/admin/deleteplan?plan_no=${vo.plan_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>