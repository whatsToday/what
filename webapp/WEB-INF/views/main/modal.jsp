<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/assets/css/main/ws.css" rel="stylesheet" />
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
		   <div class="wsTable" style="border:none; width:100%; height:780px; padding:4px 10px;">
			     <table style="height:100%;">
			     	<tr>
			     		<td height="100px">
			     		<h1><font size="6" color=" #53A6CF "><b>테마 고르기</b></font></h1>
			     		<h4><font size="4" color=" #53A6CF "><b>선택하신 테마에 맞게 지도에 추천 장소를 띄워드릴 것입니다.</b></font></h4>
			     		</td>
			     	</tr>
			     	<tr>
			     		<td height="42px">
			     			<div class="searchTm">
			     				<input type="text" placeholder="search..."></input>
			     			</div>
			     		</td>
					<tr>
						<td height="530px">
							<div style="overflow:scroll; width:100%; heigth:100%;">
							<table style="border-collapse: separate; border-spacing: 5px;"><tr>
								<c:forEach var="theme" items="${themeList }" varStatus="status">
									<c:if test="${status.index%5==0 }"><tr></tr></c:if>
											<td id="theme_no_${theme.getTheme_no()}" class ="themeBox" data-no="${theme.getTheme_no()}" data-name="${theme.getThemeName()}"
											 onclick="checkTm(this)" background="${theme.getImageUrl()}">
											<span></span><div><strong>${theme.getThemeName()}</strong></div></td>
								</c:forEach>
							</tr></table></div>
						</td>
					</tr>
					<tr>
						<td class="submitTm" onclick="submitTm();$('#lean_overlay').click();">완료</td>
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
width: 50%;
height: 780px;
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
function checkTm(theme){
	var checkList =document.getElementsByClassName("checkTm");
	console.log(checkList);
	
	if(theme.className.indexOf("checkTm") > -1 ){
		theme.className = theme.className.split(' ')[0];
	}else {
		theme.className += ' checkTm';	
	}
	
}
  ${ themeBoxList}  
function checkThemeBox(){
	var themeList =document.getElementsByClassName("themeBox");
 	var $themeBoxList = ${themeBoxList} // $('themeBoxList');
	
	for (var i = 0; i < $themeBoxList.length; i++) {
		document.getElementById('theme_no_'+$themeBoxList[i].theme_no).className  += ' checkTm';	
		//console.log(document.getElementById('theme_no_'+$themeBoxList[i].theme_no));
	}
}

function submitTm(){
	var checked = document.getElementsByClassName("checkTm");
	console.log(checked);
	
//	var member_no =${authUser.getMember_no()};
//	var theme_no = checked[0].getAttribute("data-no");
//	var themeName = checked[0].getAttribute("data-name");;

	var url="/insertThemeBox?param="+checked[0].getAttribute("data-no");
	
	for (var i = 1; i < checked.length; i++) {
		url += "&param="+checked[i].getAttribute("data-no");
	}
	location.href=url;
	
	
	//console.log(member_no+','+theme_no+','+themeName);
	//member_no , theme_no , themeName
	
// 	$.ajax({
// 		type: "Post",
// 		url: "/insertThemeBox",
// 		data:{
// 			member_no : member_no,
// 			theme_no : theme_no,
// 			themeName : themeName
// 		},
// 		success: function(response){
// 			console.log("insertThemeBox 성공");
			
// 			//다시 테마 해논거 체크유무 설정 해주기.
// 			checkThemeBox();
			
// 			location.reload();
			

// 		},
// 		error:function(jqXHR, textStatus, errorThrown){
//             alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
//             self.close();
//         }
		
// 	});//end ajax1
	
	
}
</script>




