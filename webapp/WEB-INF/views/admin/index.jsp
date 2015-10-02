<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>미니언 스터디</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/assets/css/font.css" rel="stylesheet" type="text/css">
<link href="/assets/css/middle.css" rel="stylesheet" type="text/css">
</head>
<body style="margin: 0">
	<div id="container">
		<div id="top">
		<%-- 	<c:import url="/WEB-INF/views/include/top.jsp"></c:import> --%>
		</div>
		<!-- TOP끝------------->

		<table 	align="center">
			<tr>
				<!---- 화면 우측(신상품) 시작 -------------------------------------------------->
				<td height="100%" valign="top"></td>
				<td width="10"></td>

				<!-------------------------------------------------------------------------------------------->
				<!-- 				 				mainboard                                                                                                                                                     -->
				<!-------------------------------------------------------------------------------------------->

				<td id="mainboard">
					
					
			<table >
			<tr>
							<td colspan="4" height="60"><img alt="메인화면" src="/assets/images/banner.png"
								width="767" height="40"></td>
						</tr>
				<tr><td height="15"></td></tr>
			</table>

			<table>
				<tr>
					<td align="center">
						<div>
							<%-- <c:import url="/WEB-INF/views/admin/addstudent.jsp"></c:import> --%>
						</div>
						<div>
							<%-- <c:import url="/WEB-INF/views/admin/addbook.jsp"></c:import> --%>
						</div>
					</td>
				</tr>
			</table>
				<table >
				<tr><td height="15"></td></tr>
			<tr>
							<td colspan="4" height="60"><img alt="메인화면" src="/assets/images/banner.png"
								width="767" height="40"></td>
						</tr>
			</table>
					
					</td>
					<!-------------------------------------------------------------------------------------------->
					<!-- 								mainboard                                                                                                                                                     -->
					<!-------------------------------------------------------------------------------------------->
				<td width="10"></td>
				<td height="100%" valign="top"></td>

				</td>
				<!---- 화면 우측(신상품) 끝 -------------------------------------------------->

			</tr>
		</table>

		<!-- 화면 하단 부분 시작 (main_bottom.jsp) : 회사정보/회사소개/이용정보/개인보호정책 ... ---------->
		<div id=bottom>
			<%-- <c:import url="/WEB-INF/views/include/bottom.jsp"></c:import> --%>
		</div>
		<!-- 화면 하단 부분 끝 (main_bottom.jsp) : 회사정보/회사소개/이용정보/개인보호정책 ... ---------->
	</div>
</body>
</html>