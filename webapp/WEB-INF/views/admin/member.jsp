<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<tr>
		<td>
		<h1> Member 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">아이디</td>
						<td bgcolor="#CCCCCC" align="center">이름</td>
						<td bgcolor="#CCCCCC" align="center">이메일</td>
						<td bgcolor="#CCCCCC" align="center">패스워드</td>
						<td bgcolor="#CCCCCC" align="center">imageUrl</td>
						<td bgcolor="#CCCCCC" align="center">권한</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertmember" method="post" enctype="multipart/form-data">
					<tr>
						<td><input size="10" type="text" name="memberId"></td>
						<td><input size="10" type="text" name="memberName"></td>
						<td><input size="10" type="text" name="email"></td>
						<td><input size="10" type="password" name="password"></td>
						<td><input size="10" type="file" name="img"></td>
						<td><select name="memberGrade">
							  <option value="Admin">Admin</option>
							  <option value="Guest">Guest</option>
							</select>						
						</td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> Member 조회</h1>
					<table id="selectMember" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">No</td>
						<td bgcolor="#CCCCCC" align="center">이름</td>
						<td bgcolor="#CCCCCC" align="center">이메일</td>
						<td bgcolor="#CCCCCC" align="center">패스워드</td>
						<td bgcolor="#CCCCCC" align="center">imageUrl</td>
						<td bgcolor="#CCCCCC" align="center">권한</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${memberList}">
					<tr>
						<td>${vo.member_no }</td>
						<td>${vo.memberName }</td>
						<td>${vo.email }</td>
						<td>${vo.password }</td>
						<td><c:choose>
								<c:when test="${not empty vo.imageUrl }">
				<img src="${vo.imageUrl }" style="width:150px">
								</c:when>
								<c:otherwise>
								고객의 사진이 없습니다.								
								</c:otherwise>
							</c:choose>
						<td>${vo.memberGrade }</td>
						<td><a href="/admin/deletemember?member_no=${vo.member_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>