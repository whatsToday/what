var nearOn = false;
var myLoc =false;
var mapResult =true;
var obefore = "";
var userLocation;
var TOP10 = 10; 

function initKey(){
	var sH = document.getElementById('showHot');
	var sT = document.getElementById('showHotToday');
	var tI = document.getElementById('TodayIssue');
	
	$.ajax({
		url: "/initKey",
		data:{
			lat : userLocation.getLat(),
			lng : userLocation.getLng(),
			distance : circle.getRadius()/1000
		},
		success: function(response){
			
			function array(id, title, array){
				var keys = "<table><tr><th class='wshd' colspan='5'>"+title+"</th></tr>";
				if(array.length<10){
					for (var i = array.length; i < TOP10; i++) {
						array[i]="&middot;";
					}
				}
				for (var i = 0; i < TOP10; i++) {
					keys += "<tr><td>"+(i+1)+"</td><td colspan='4'>"+array[i]+"</td></tr>";
				}
				keys +="</tr></table>"; 
				
				id.innerHTML= keys;
			};
			
			//showHotKey
			array(sH,'이 주변 핫 키워드',response.showHotKey);
			//showHotToday
			array(sT,'주변 오늘 핫 키워드',response.showHotToday);
			//TodayIssue
			array(tI,'전국 오늘 핫 키워드',response.TodayIssue);
		},
		error:function(jqXHR, textStatus, errorThrown){
			alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
            self.close();
        }//end ajax
	});
	
}

function checkOnOff(){
		var sa = document.getElementById('showAll');
		var wa = document.getElementById('wholeAll');
	
	if(nearOn){
		if(document.getElementById('showAll')){
			document.getElementById('showAll').innerText = "모두 보기";
			sa.style.backgroundColor="#fff";
			sa.id="wholeAll";
		}
	}else{
		if(document.getElementById('wholeAll')){
			wa.innerText = "추천 후기";
			wa.style.backgroundColor="#9DD4F0";
			wa.id="showAll";
		}
	}
}

function markTheme(Obj){
	var ob = document.getElementById(Obj.id);
	var themeClass = document.getElementsByClassName('markTheme');
	for ( var k in themeClass) {
		themeClass[k].className="themeClass"
	}
	ob.className += " markTheme";
	mapResult=true;
}

function insertKey(keyword){
	$.ajax({
		url: "/insertKey",
		data:{
			keyword : keyword,
			lat : userLocation.getLat(),
			lng : userLocation.getLng()
		},
		success: function(response){
			
		},
		error:function(jqXHR, textStatus, errorThrown){
			alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
            self.close();
        }//end ajax
		
	});//end display window 2
	
}
function themeSearch(Obj) {
	console.log(mapResult);
	var themeName = Obj.id;
	
			if(themeName=="showAll"){
				placesNear();
				 for (var i = 0; i < markers.length; i++) {
					 markers[i].setVisible(true);
				 }  
				 nearOn=true;
				 checkOnOff();
				
			}else if(themeName=="wholeAll"){
				var themeList = document.getElementsByClassName("themeClass");
				
				 ps.keywordSearch( themeList[0].textContent, placesSearchCB, {
						location: userLocation,
						radius : circle.getRadius(),	
						sort    : daum.maps.services.SortBy.POPULARITY
				}); 
				 nearOn=false;
				 checkOnOff();
			}else{
				themeName=Obj.outerText;
				
					if(nearOn){
							//후기글이 없으면?
							var k = 0 ;
							for (var i = 0; i < placesArray.length; i++) {
								markers[i].setVisible(false);
								if(placesArray[i].category.indexOf(themeName) != -1){
									k++;
									markers[i].setVisible(true);
								}
							}
							if(k==0){
								alertModal('선택 범위안에 후기글이 없습니다');
							    ps.keywordSearch( themeName, placesSearchCB, {
									location: userLocation,
									radius : circle.getRadius(),	
									sort    : daum.maps.services.SortBy.POPULARITY
								}); 
							    
							    nearOn=false;
								checkOnOff();
							}else{ markTheme(Obj);}
					}else{
					    ps.keywordSearch( themeName, placesSearchCB, {
							location: userLocation,
							radius : circle.getRadius(),	
							sort    : daum.maps.services.SortBy.POPULARITY
						}); 
					    if(mapResult){
					    	nearOn=false;
					    	checkOnOff();
					    	markTheme(Obj);
					    }
					}
						
			}
	console.log(mapResult);
}

function changeLocation(){
	  map.setCenter(userLocation);
	  
	  var beforeRadius = circle.getRadius();
	  circle.setMap(null);
	  circle.setPosition(userLocation);
	  circle.setRadius(beforeRadius);
	  circle.setMap(map);	

	  
	  initKey();
	  
}




		var options = {
		  enableHighAccuracy: true,
		  timeout: 5000,
		  maximumAge: 0
		};

		function success(pos) {
		  var crd = pos.coords;
		  myLoc = true;
		  
		  userLocation=new daum.maps.LatLng(crd.latitude, crd.longitude);
		  map.setCenter(userLocation);
		  //circle
		  circle.setMap(null);
			circle.setPosition(userLocation);
			circle.setRadius(500);//meter 단위
			circle.setMap(map);	
			
			
			initKey();
			//places near
		  placesNear();
		  
		//전부 다 보기
		};

		function error(err) {
			alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
		};
		
		
		
		
//getMyPlan
function getMyPlan() {
	$.ajax({
		type : "Post",
		url : "/getMyPlan",
		success : function(response) {

			var se = document.getElementById('plan_no');

				for ( var i in response.MyPlanList) {
					var pvo = response.MyPlanList[i];
					var op = document.createElement("option");
					op.value = pvo.plan_no;
					op.innerHTML = pvo.planName;
					op.selected = true;
	
					se.appendChild(op);
				}
				if(se.value!=-1){
					se.childNodes.item(0).selected = true;
					callContents(se.value);
				}else{
					defaulContents();
				}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
			self.close();
		}
	});// end ajax1
}
		
//createPlan
function createPlan(){
		
	$.ajax({
		type : "Post",
		url : "/createPlan",
		success : function(response) {
			
			var se = document.getElementById('plan_no');
			while (se.firstChild) {
				se.removeChild(se.firstChild);
			}
			getMyPlan();
			defaulContents();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
			self.close();
		}
	});// end ajax1
	
	
}

//deletePlan
function deletePlan(){
	var $pName = $( "#plan_no option:selected" ).text();
	var $pNo = $( "#plan_no option:selected" ).val();
	
	var ask = confirm($pName+"(을)를 지우시겠습니까?");
	
	if(ask){
		
		$.ajax({
			url : "/deletePlan",
			data : {
				plan_no : $pNo,
			},
			success : function(){
				
				var se = document.getElementById('plan_no');
				//se 초기화
				while (se.firstChild) {
					se.removeChild(se.firstChild);
				}
				getMyPlan();
				
			},
			error:function(jqXHR, textStatus, errorThrown){
				alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
	            self.close();
	        }
		});
		
	}
}

// insertPlan
function insertPlan(index){
	var plan_no = document.getElementById('plan_no').value;
	
	items=placesArray[index];
	
	$.ajax({
		type: "Post",
		url: "/insertPlan",
		data:{
			plan_no : plan_no,
			phone : items.phone,
			newAddress : items.newAddress,
			imageUrl : items.imageUrl,
			direction : items.direction,
			zipcode : items.zipcode,
			placeUrl : items.placeUrl,
			id  : items.id,
			title : items.title,
			category : items.category,
			address  : items.address,
			longitude : items.longitude,
			latitude  : items.latitude,
			addressBCode : items.addressBCode
		},
		success: function(response){
			//오늘 일정을 넣을때
			if(plan_no=="-1"){
				var se = document.getElementById('plan_no');
				//se 초기화
				while (se.firstChild) {
					se.removeChild(se.firstChild);
				}
				getMyPlan();
			}else{
				//일정을 선택해있었을때
				callContents(plan_no);
			}
			infowindow2.close();
			alertModal('찜하기 성공!');
			userLocation = new daum.maps.LatLng(items.latitude,items.longitude);
			changeLocation();
		},
		error:function(jqXHR, textStatus, errorThrown){
			alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
            self.close();
        }
		
	});//end ajax1
	
}
function contentView(index){
	
items=placesArray[index];
	
	$.ajax({
		url: "/insertContent",
		data:{
			phone : items.phone,
			newAddress : items.newAddress,
			imageUrl : items.imageUrl,
			direction : items.direction,
			zipcode : items.zipcode,
			placeUrl : items.placeUrl,
			id  : items.id,
			title : items.title,
			category : items.category,
			address  : items.address,
			longitude : items.longitude,
			latitude  : items.latitude,
			addressBCode : items.addressBCode
		},
		success: function(response){
			location.href = "/contentview?content_no="+response.contentVo.content_no;
		},
		error:function(jqXHR, textStatus, errorThrown){
			alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
            self.close();
        }
		
	});//end ajax1
}

function callContents(plan_no){
	$.ajax({
		type: "Post",
		url: "/callContents",
		data:{
			plan_no : plan_no,
		},
		success: function(response){
			
			var sP =document.getElementById('showPlan');

			var node ; 
			var i=0;
			var last = sP.childNodes.length;
			for ( var j=last-1 ; j > 1 ;j--){
				node = sP.childNodes.item(j); 
				if(node.nodeName=='TR') {
					sP.removeChild(node);
				}
			}
			
				if(response.contentList.length != 0){
					for (var i in response.contentList) {
						var planLi = document.createElement('tr');
						//
						var planStr ='<td><table onclick="map.setCenter(new daum.maps.LatLng('+response.contentList[i].latitude+','+response.contentList[i].longitude+'))"><tr><td colspan="2" class="wshd2">'+response.contentList[i].title+'</td></tr>';
						
//							planStr +='<tr><td rowspan="4">';
//							if(response.contentList[i].imagUrl){
//								planStr +='<img height="130px" src="'+response.contentList[i].imagUrl+'" alt="사진이 없습니다"></td>';
//							}else{
//								planStr +='<img height="130px" src="/product-images/20159120531936.png" alt="사진이 없습니다"></td>';
//							}
							planStr +='<tr><td><img src="/assets/img/addresss.png">&nbsp;'+response.contentList[i].newAddress+'</td>';
							planStr +='<td><img src="/assets/img/calll.png">&nbsp;'+response.contentList[i].phone+'</td></tr>';
							planStr +='<tr><td><a href="/contentview?content_no='+response.contentList[i].content_no+'">상세 보기 이동</a>&nbsp;<img src="/assets/img/vieww.png"></td>';
							planStr +='<td><a href="#" onclick="cancelContents('+response.contentList[i].content_no+'); return false;">이 일정에서 빼기</a>&nbsp;<img src="/assets/img/crosss.png"></td></tr>';
						
							planStr +='</table></td>';
						
						
						planLi.innerHTML = planStr;
						sP.appendChild(planLi);
					}
				}else{
					defaulContents();
				}

		},
		error:function(jqXHR, textStatus, errorThrown){
            alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
            self.close();
        }
		
	});//end ajax1
	
}

function cancelContents(content_no){
	var plan_no = $('#plan_no option:selected').get(0).value;
	
	$.ajax({
		type: "Post",
		url: "/cancelContents",
		data:{
			plan_no : plan_no,
			content_no : content_no
		},
		success: function(response){
			
			callContents(plan_no);
		},
		error:function(jqXHR, textStatus, errorThrown){
            alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
            self.close();
        }
		
	});//end ajax1
	
}

function defaulContents(){
	
	var sP =document.getElementById('showPlan');
	
	var planLi = document.createElement('tr');
	var planStr ='<td  height="100px"><span>지도 우 클릭 <img src="/assets/img/mouse_select_right.png"/> &nbsp; &rightarrow; <b>&nbsp;</b> 마커 클릭 후 찜하기<br><br><b>등록된 일정이 없습니다</b></td>';
	
	planLi.innerHTML = planStr;
	sP.appendChild(planLi);
}


function placesNear(){
	
	var themeList = document.getElementsByClassName("themeClass");
//	var theme = [] ;
	var url = "/placesNear";
	
	if(themeList.length >= 1){
		url += "?themeName="+themeList[0].textContent;
		for (var i = 1; i < themeList.length; i++) {
			url +="&themeName="+themeList[i].textContent;
		}
	}
	//후기글 가져오기
	var lvl=map.getLevel();
	$.ajax({
		  url: url,
		  data: {
			lat : userLocation.getLat(),
			lng : userLocation.getLng(),
			distance : circle.getRadius()/1000 
		  },
			success : function(response){
				if(response.contentList.length!=0){
					displayPlaces(response.contentList);
					if(map.getLevel() < lvl){
						map.setLevel(lvl);
					}
					nearOn=true;
				}else{
					//alert
					alertModal('선택 범위안에 후기글이 없습니다');
					
					 ps.keywordSearch( themeList[0].textContent, placesSearchCB, {
							location: userLocation,
							radius : circle.getRadius(),	
							sort    : daum.maps.services.SortBy.POPULARITY
					}); 
					 
						if(map.getLevel() < lvl){
							map.setLevel(lvl);
						}

					 markTheme(themeList[0]);
					 nearOn=false;
				}
				checkOnOff();
			},
			error: function (xhr, textStatus, errorThrown) { 
				alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
			},
		});
	
}

function purpleMarker(marker,index){
	
    var imageSrc = '/assets/img/marker/purple.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
        spriteOrigin : new daum.maps.Point(0, ((index)*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions);
    marker.setImage(markerImage);
}
function greenMarker(marker,index){
	
    var imageSrc = '/assets/img/marker/blue_green.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
        spriteOrigin : new daum.maps.Point(0, ((index)*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions);
    marker.setImage(markerImage);
}
function alertModal(text,time){
	time = time || 1300; 
	text = '<b>'+text+'</b>';
	
//	document.getElementById('alertModal').innerHTML=text;
//	$('#aModal').click();
//	setTimeout(function() {$('#lean_overlay').click();},time);
	document.getElementById('messagee').innerHTML=text;
	$('#messagee').show();
	$('#messagee').css('opacity','1');
	setTimeout(function() {$('#messagee').animate({ opacity: 0 });},time);
//	setTimeout(function() {$('#messagee').fadeTo( 1000, 0 );},time);
	
}


///staticMapModal
function callMap(){
	
	var markers2 = [{
		position: new daum.maps.LatLng(33.450701, 126.570667)
	},{
		position: new daum.maps.LatLng(33.450001, 126.570467), 
		text: '텍스트를 표시할 수 있어요!' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
	}
	];
	
	var staticMapContainer  = document.getElementById('staticMapModal'), // 이미지 지도를 표시할 div  
	staticMapOption = { 
		center: new daum.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
		level: 3, // 이미지 지도의 확대 레벨
		marker: markers2 // 이미지 지도에 표시할 마커 
	};    
	
	var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
}