<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- join  modal -->
<%-- <c:if test="${not empty authUser }"> --%>
<!-- <a id="join" rel="leanModal" href="#joinModal">join header</a> -->
<!-- <div id="joinModal"> -->
<!-- 		   <div class="wsTable" style="border:none; width:100%; height:100%;"> -->
<!-- 			     <table> -->
<!-- 					<tr> -->
<!-- 						<td style="text-align:right">로그인</td> -->
<!-- 			     	</tr> -->
<!-- 			     	<tr> -->
<!-- 			     		<td>오늘 뭐하지</td> -->
<!-- 			     	</tr> -->
<!-- 					<tr> -->
<!-- 						<td><input type="text" name="email"/></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td><input type="password" name="password"/></td> -->
<!-- 					</tr>      -->
<!-- 					<tr> -->
<!-- 						<td><button  onclick="$('#picktheme').click();$('#joinModal').hide();">가입</button></td> -->
<!-- 					</tr> -->
<!-- 			     </table> -->
<!-- 		    </div> -->
<!-- </div> -->
<%-- </c:if> --%>

<!-- theme modal -->
<a id="picktheme" rel="leanModal" href="#themeModal">pickTheme</a>
<div id="themeModal">
		   <div class="wsTable" style="border:none; width:100%; height:100%;">
			     <table>
			     	<tr>
			     		<td colspan="5">선택하신 테마에 맞게 지도에 추천 장소를 띄워드릴 것입니다.</td>
			     	</tr>
			     	<tr><td colspan="5">검색창</td></tr>
					<tr>
						<c:forEach var="theme" items="${themeList }" varStatus="status">
							<c:if test="${status.index%5==0 }"><tr></tr></c:if>
							<td>${theme.getThemeName()}${theme.getImageUrl()}</td>
<!-- 							bgcolor=imagurl  -->
						</c:forEach>
					</tr>
					<tr>
						<td colspan="5"><button onclick="$('#lean_overlay').click();$('#themeModal').hide();">선택 끝</button></td>
					</tr>
			     </table>
		    </div>
</div>
<style>

a[rel=leanModal] {
	visibility: hidden;
}


#lean_overlay {
    position: fixed;
    z-index:100;
    top: 0px;
    left: 0px;
    height:100%;
    width:100%;
    background: #000;
    display: none;
}

#joinModal {
width: 716px;
height: 430px;
/* width: 600px; */
/* padding: 30px; */
display: none; 
background: #FFF;
border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
box-shadow: 0px 0px 4px rgba(0,0,0,0.7);
-webkit-box-shadow: 0 0 4px rgba(0,0,0,0.7);
-moz-box-shadow: 0 0px 4px rgba(0,0,0,0.7);
}

#themeModal {
width: 716px;
height: 430px;
/* width: 600px; */
/* padding: 30px; */
display: none; 
background: #FFF;
border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
box-shadow: 0px 0px 4px rgba(0,0,0,0.7);
-webkit-box-shadow: 0 0 4px rgba(0,0,0,0.7);
-moz-box-shadow: 0 0px 4px rgba(0,0,0,0.7);
}
</style>
	

<script type="text/javascript">
  //$("#login").leanModal();
  $('a[rel*=leanModal]').leanModal();
  $("#join").click();
  
//   $("#joinModal").on('hide', function(){
//   });

</script>




