<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<tr>
		<td>
		<h1> Theme 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">관심사명</td>
						<td bgcolor="#CCCCCC" align="center">이미지등록</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/inserttheme" method="post" enctype="multipart/form-data">
					<tr>
						<td><input size="10" type="text" name="themeName"></td>
						 <td><input type="file" name="img"></td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> Theme 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">No</td>
						<td bgcolor="#CCCCCC" align="center">관심사명</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${themeList}">
					<tr>
						<td>${vo.theme_no }</td>
						<td>${vo.themeName }</td>
					<td><c:choose>
					<c:when test="${not empty vo.imageUrl }">
			     	<img src="${vo.imageUrl }" style="width:150px">
								</c:when>
								<c:otherwise>
								플랜 사진 없습니다.							
								</c:otherwise>
							</c:choose>
							</td>
						<td><a href="/admin/deletetheme?theme_no=${vo.theme_no }">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
				<h6>삭제하려면 해당 관심사로 등록되어 있는 Content를 먼저 삭제해야 합니다.</h6>
		</td>
	</tr>
				