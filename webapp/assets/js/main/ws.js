var nearOn = false;
var mapResult =true;
var obefore = "";
var userLocation;
var TOP10 = 10; 
var checkBool = false;


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
					keys += "<tr><td>"+(i+1)+"</td><td colspan='4'><a href='#' onclick='searchKeyAll(this.outerText); return false'>"+array[i]+"</a></td></tr>";
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
		var cB = document.getElementById('checkTd');
//showAll 		
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
//checkJjim	
	if(checkBool){
			cB.innerText = "돌아가기";
			cB.style.backgroundColor="#9DD4F0";
	}else{
			cB.innerText = "찜한 곳 보기";
			cB.style.backgroundColor="#fff";
	}
}

function comeBack(){
	userLocation = markKeeper.loc;
	changeLocation();
	if(markKeeper.theme != undefined){
		markTheme(markKeeper.theme);
	}
	displayPlaces(markKeeper.marks);
}

function markTheme(Obj){
		var ob = document.getElementById(Obj.id);
		clearMarkTheme();
		ob.className += " markTheme";
}
function clearMarkTheme(){
	var themeClass = document.getElementsByClassName('markTheme');
	for ( var k in themeClass) {
		themeClass[k].className="themeClass"
	}
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
	checkBool = false; 
	  checkOnOff();
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
				
				searchKey(themeList[0].textContent);
				 nearOn=false;
				 checkOnOff();
			}else{
				themeName=Obj.outerText;
				
					if(nearOn){
						console.log("1");
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
//								$(function(){
									console.log("f");
									alertModal('선택 범위안에 후기글이 없습니다');
									searchKey(themeName);
//								}).done(function(){

							    	nearOn=false;
							    	checkOnOff();
							    	markTheme(Obj);
//								});
							}
//							else{ markTheme(Obj);} 2015 10 14 12 38 
					}else{
						console.log("111111111111111111111                test 시작");
						
						
						searchKey(themeName);
							
//						dfd.done(function(){
							console.log("33333333333       mapResult test="+mapResult);
							if(mapResult){
						    	nearOn=false;
						    	checkOnOff();
						    	markTheme(Obj);
						    }
							
//						}); 
					    
					}
						
			}
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
						var planStr ='<td><table class="selectedContents" data-no="'+response.contentList[i].content_no+'" ><tr><td colspan="2" class="wshd2">'+response.contentList[i].title+'</td></tr>';
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
					searchKey(themeList[0].textContent);
					 
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
	
	document.getElementById('messagee').innerHTML=text;
	$('#messagee').show();
	$('#messagee').css('opacity','1');
	setTimeout(function() {$('#messagee').animate({ opacity: 0 });},time);
	
}

function checkJjim(){
	var tables = document.getElementsByClassName('selectedContents');
	var url = "/checkJjim";
	
	
	  if(!checkBool){
		if(tables.length!=0){
				url += "?content_no="+tables[0].getAttribute('data-no');
			for (var k = 1; k < tables.length; k++) {
				url += "&content_no="+tables[k].getAttribute('data-no');
			}
			
			//후기글 가져오기
			var lvl=map.getLevel();
	
			$.ajax({
				  url: url,
					success : function(response){
						markKeeper.marks = placesArray;
						markKeeper.loc = userLocation;
						markKeeper.theme = document.getElementsByClassName('markTheme')[0];
						checkBool = true; 
						var linePath = [];
						// 지도에 표시할 선을 생성합니다
						
						//1개 이상 마커
						if(response.contentList.length!=0){
							//마커짓
							displayPlaces(response.contentList);
							userLocation = map.getCenter();
							changeLocation();
							//시야
							if(map.getLevel() < lvl){
								map.setLevel(lvl);
							}
							
							//선 그리기
							for (var j = 0; j < response.contentList.length; j++) {
								var latitude = response.contentList[j].latitude;
								var longitude = response.contentList[j].longitude;
								
								linePath.push(new daum.maps.LatLng(latitude, longitude));
							}
							
							//긋기
							polyline.setPath(linePath);
							polyline.setMap(map);
							
							//거리 계산
							var distance = Math.round(polyline.getLength()),
								content = getTimeHTML(distance);
							
							distanceOverlay.setContent(content);
							distanceOverlay.setPosition(linePath[linePath.length-1]);
							distanceOverlay.setMap(map);
							
							
							//markTheme 초기화
							var themeClass = document.getElementsByClassName('markTheme');
							for ( var k in themeClass) {
								themeClass[k].className="themeClass"
							}
						}else{
							//alert
							alertModal('찜하신 내용이 없습니다');
						}
						checkOnOff();
					},
					error: function (xhr, textStatus, errorThrown) { 
						alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
					},
				});
			
			
		}else alertModal('찜하신 내용이 없습니다');
	  }else{
		  comeBack();
		  checkBool = false; 
		  checkOnOff();
	  }
	
}

function linePath (){
	
	// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
	var linePath = [
	    new daum.maps.LatLng(33.452344169439975, 126.56878163224233),
	    new daum.maps.LatLng(33.452739313807456, 126.5709308145358),
	    new daum.maps.LatLng(33.45178067090639, 126.5726886938753) 
	];

	// 지도에 표시할 선을 생성합니다
	var polyline = new daum.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FFAE00', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다 
	polyline.setMap(map);  
	
	
}

function searchKey(keywordd){
	 ps.keywordSearch( keywordd, placesSearchCB, {
			location: userLocation,
			radius : circle.getRadius(),	
			sort    : daum.maps.services.SortBy.POPULARITY
	}); 
}
function searchKeyAll(keywordd){
	 ps.keywordSearch( keywordd, placesSearchCB, {
			sort    : daum.maps.services.SortBy.POPULARITY
	}); 
}

