<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>
	<tr>
		<td>
		<h1> ThemeBox 등록</h1>
				<table border="1" >
					<tr>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center">theme_no</td>
						<td bgcolor="#CCCCCC" align="center"><b>등록</b></td>
					</tr>
			<form action="/admin/insertthemebox" method="post">
					<tr>
						<td>
							<select name="member_no">
							 <c:forEach var="vo" items="${memberList}">
							  <option value="${vo.getMember_no()}">${vo.getMember_no()}</option>
							 </c:forEach>
							</select>
						</td>
						<td>
							<select name="theme_no">
							 <c:forEach var="vo" items="${themeList}">
							  <option value="${vo.getTheme_no()}">${vo.getThemeName()}</option>
							 </c:forEach>
							</select>
						</td>
						<td>
						   <input size="10" type="text" name="themeName">
						</td>
						<td><input size="10" type="submit" value="등록"></td>
					</tr>
			</form>
				</table>
				<h1> ThemeBox 조회</h1>
					<table class="selectVo" border="1">
					<tr>
						<td bgcolor="#CCCCCC" align="center">NO</td>
						<td bgcolor="#CCCCCC" align="center">member_no</td>
						<td bgcolor="#CCCCCC" align="center">theme_no</td>
						<td bgcolor="#CCCCCC" align="center">themeName</td>
						<td bgcolor="#CCCCCC" align="center">삭제</td>
					</tr>
					<c:forEach var="vo" items="${themeBoxList}">
					<tr>
						<td>${vo.themeBox_no }</td>
						<td>${vo.member_no }</td>
						<td>${vo.theme_no }</td>
						<td>${vo.themeName }</td>
						<td><a href="/admin/deletethemebox?themeBox_no=${vo.themeBox_no}">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
		</td>
	</tr>
				