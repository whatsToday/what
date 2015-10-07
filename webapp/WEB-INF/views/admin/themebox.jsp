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
						<td bgcolor="#CCCCCC" align="center">themeName</td>
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
							<select name="theme_no" onchange="changeTheme(this.value)">
							 <c:forEach var="vo" items="${themeList}">
							  <option value="${vo.getTheme_no()}">${vo.getTheme_no()}</option>
							 </c:forEach>
							</select>
						</td>
						<td>
						   <input size="10" type="text" id="themeName" name="themeName" readonly="readonly">
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
			<table >			
<tr>
   <td>
      <c:if test="${nowpage<=1}">
         [이전]&nbsp;
      </c:if>
      <c:if test="${nowpage>1}">
         <a href="/admin/themebox?page=${nowpage-1}">[이전]</a>&nbsp;
      </c:if>
      <c:forEach var="a" begin="${startpage}"  end="${endpage}">
             <c:if test="${a==nowpage}">
                <font color="red">[${a}]</font>
             </c:if>
             <c:if test="${a!=nowpage}">
                <a href="/admin/themebox?page=${a}">[${a}]</a>&nbsp;
             </c:if>    
      </c:forEach>
      <c:if test="${nowpage>=maxpage}">
           [다음]&nbsp;
      </c:if>
      <c:if test="${nowpage<maxpage}">
           <a href="/admin/themebox?page=${nowpage+1}">[다음]</a>
      </c:if>
   </td>
</tr>
</table>
	</tr>
<script type="text/javascript">
function changeTheme(val){
	$.ajax({
		type : 'get',
	    url:'/admin/getthemename',
	    data : {
	    	 theme_no : val
	    },
	    dataType:'json',
	    success: function(response){
	    	$("#themeName").val(response.themeName);
	    } 
	 })
} 

</script>		