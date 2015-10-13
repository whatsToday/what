<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/assets/css/main/ws.css" rel="stylesheet" />
<script>

// function showAgain(){
// 	var tL = ${themeList[0].themeName};
// 	console.log(tL);
// }

</script>
<a id="aModal" rel="leanModal" href="#alertModal">alertModal</a>
<div id="alertModal"></div>

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
			     				<input id="textSearch" type="text" placeholder="search..."></input>
			     			</div>
			     		</td>
					<tr>
						<td height="530px">
							<div id="themeDiv" class="ivory">
							<table id="themeTable"><tr>
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
<div id="messagee"></div>
<a id="staticMap" rel="leanModal" href="#staticMapModal">pickTheme</a>
<div id="staticMapModal"></div>

<style>

a[rel=leanModal] {
	visibility: hidden;
}

#messagee {
	position: fixed;
    z-index:100;
/* 	bottom:7%; */
    left: 35%; 
	top:8%;
/* 	right :30%; */
    width:30%;
    height:70px;
    line-height:70px;
    border : 1px solid #69ABED;
    text-align :center;
    font-size:18px;
    opacity : 0.1;
    border-radius: 5px;
    background-color : #9DD4F0;
    
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

#joinModal,#staticMapModal {
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

#alertModal {
width: 20%;
height: 100px;
line-height : 100px;
display: none; 
background: #FFF;
border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
box-shadow: 0px 0px 4px rgba(0,0,0,0.7);
-webkit-box-shadow: 0 0 4px rgba(0,0,0,0.7);
-moz-box-shadow: 0 0px 4px rgba(0,0,0,0.7);

text-align : center;
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
	console.log(checkList.length);
		if(theme.className.indexOf("checkTm") > -1 ){
			theme.className = theme.className.split(' ')[0];
		}else {
		 	if(checkList.length <= 4){
				theme.className += ' checkTm';	
 			}else{ alert("5개 이상 더 고르면 안 예뻐요");}
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
	
}

$('#textSearch').keyup(function() {
	var text =$(this).val();
    var tb  = document.getElementById("themeTable");
    
	$.ajax({
		url:"/textSearch",
		data:{
			text : text
		},
		success: function(response){
			var content = '<tr><td colspan="5"></td></tr>';
			for (var i = 0; i < response.themeList.length; i++) {
				if(i%5==0 && i != 0) content+='<tr></tr>';
				content += '<td id="theme_no_'+response.themeList[i].theme_no+'" class ="themeBox" data-no="'+response.themeList[i].theme_no+'" data-name="'+response.themeList[i].themeName+'"onclick="checkTm(this)" background="'+response.themeList[i].imageUrl+'"><span></span><div><strong>'+response.themeList[i].themeName+'</strong></div></td>';
			}
			tb.innerHTML = content;
		},
		error:function(jqXHR, textStatus, errorThrown){
    alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
    self.close();
}
	});//end ajax
    
});
</script>




