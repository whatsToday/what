<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">





	<header> 
	<c:choose>
		<c:when test="${param.pageName=='planView' }">

			<div id="menu_div" style="z-index: 10000;">
				<div id="navigation">
					<div id="menu">
						<ul class="nav navbar-nav" style="float: right; ">
							<li class="active"><a href="/mypage/">내플랜</a></li>
							<li><a href="/mypage/goodview">좋아요~</a></li>
							<li><a href="/mypage/boardview">내가 쓴 게시판</a></li>
							<li><a href="/mypage/membermodifyform">회원정보수정</a></li>
							<li><a href="/mypage/memberleave">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:when>

		<c:when test="${param.pageName=='goodView' }">
			<div id="menu_div"  style="z-index: 10000;">
				<div id="navigation">
					<div id="menu">
						<ul class="nav navbar-nav" style="float: right;">
							<li><a href="/mypage/">내플랜</a></li>
							<li class="active"><a href="/mypage/goodview">좋아요~</a></li>
							<li><a href="/mypage/boardview">내가 쓴 게시판</a></li>
							<li><a href="/mypage/membermodifyform">회원정보수정</a></li>
							<li><a href="/mypage/memberleave">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:when>

		<c:when test="${param.pageName=='myBoardView' }">
			<div id="menu_div"  style="z-index: 10000;">
				<div id="navigation">
					<div id="menu">
						<ul class="nav navbar-nav" style="float: right;">
							<li><a href="/mypage/">내플랜</a></li>
							<li><a href="/mypage/goodview">좋아요~</a></li>
							<li class="active"><a href="/mypage/boardview">내가 쓴 게시판</a></li>
							<li><a href="/mypage/membermodifyform">회원정보수정</a></li>
							<li><a href="/mypage/memberleave">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:when>

		<c:when test="${param.pageName=='memberModify' }">
			<div id="menu_div"  style="z-index: 10000;">
				<div id="navigation">
					<div id="menu">
						<ul class="nav navbar-nav" style="float: right;">
							<li><a href="/mypage/">내플랜</a></li>
							<li><a href="/mypage/goodview">좋아요~</a></li>
							<li><a href="/mypage/boardview">내가 쓴 게시판</a></li>
							<li class="active"><a href="/mypage/membermodifyform">회원정보수정</a></li>
							<li><a href="/mypage/memberleave">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
				</div>
		</c:when>

		<c:when test="${param.pageName=='memberLeave' }">
			<div id="menu_div"  style="z-index: 10000;">
				<div id="navigation">
					<div id="menu">
						<ul class="nav navbar-nav" style="float: right;">
							<li><a href="/mypage/">내플랜</a></li>
							<li><a href="/mypage/goodview">좋아요~</a></li>
							<li><a href="/mypage/boardview">내가 쓴 게시판</a></li>
							<li><a href="/mypage/membermodifyform">회원정보수정</a></li>
							<li class="active"><a href="/mypage/memberleave">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div id="menu_div"  style="z-index: 10000;">
				<div id="navigation">
					<div id="menu">
						<ul class="nav navbar-nav" style="float: right;">
							<li><a href="/mypage/">내플랜</a></li>
							<li><a href="/mypage/goodview">좋아요~</a></li>
							<li><a href="/mypage/boardview">내가 쓴 게시판</a></li>
							<li><a href="/mypage/membermodifyform">회원정보수정</a></li>
							<li><a href="/mypage/memberleave">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose> 
	</header>