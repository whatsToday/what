<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/assets/js/board/jquery-1.9.1.min.js"></script>

	<header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                 
                    <a class="navbar-brand" href="/admin"><img alt="" src="/assets/admin/img/logo.jpg"></a>
                </div>
               
               <%-- <c:when test=""> --%>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li><a href="/admin/member">가입자 명단</a></li>
                        <li class="dropdown ">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">content <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="/admin/content">content</a></li>
                                <li><a href="/admin/contentbox">contentBox</a></li>
								<li><a href="/admin/goodcontent">goodContent</a></li>
                            </ul>
                        </li>
                            <li class="dropdown ">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">theme <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="/admin/theme">theme</a></li>
                                <li><a href="/admin/themebox">themeBox</a></li>
                            </ul>
                        </li>
                            <li class="dropdown ">
                            <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">plan <b class=" icon-angle-down"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="/admin/plan">plan</a></li>
                                <li><a href="/admin/plancomments">plnaComments</a></li>
								<li><a href="/admin/goodplan">goodplan</a></li>
                            </ul>
                        </li>
                         <li><a href="/admin/follow">follow</a></li>
                        <li><a href="/admin/searchlist">searchList</a></li>
                        <li><a href="/admin/event">이벤트</a></li>
                    </ul>
                </div>
                <%-- </c:when> --%>
            </div>
        </div>
	</header>

	
	
	
	