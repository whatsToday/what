
function themeSearch(themeName) {
		//	console.log(placesArray);
		//	console.log(themeName);
			if(themeName!="showAll"){
		//		if(emti){
		//			placesNear();
		//			emti=false;
		//		}
				
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
						//아무런 후기글이 없을시 
		//				alert("0 개의 후기글이 검색되었습니다. \n\n 자동검색으로 대체합니다");
						alert("0 개의 후기글이 검색되었습니다.");
		//				
		//			    ps.keywordSearch( themeName, placesSearchCB, {
		//					location: userLocation,
		//					radius : circle.getRadius(),	
		//					sort    : daum.maps.services.SortBy.POPULARITY
		//				}); 
		//			    emti=true;	
					}
			}else{
				//userLocation = map.getCenter();
				placesNear();
				 for (var i = 0; i < markers.length; i++) {
					 markers[i].setVisible(true);
				 }  
			}
}

function changeLocation(){
	myLoc=false;
	
	  userLocation=map.getCenter();
	  map.setCenter(userLocation);
	  
	  circle.setMap(null);
	  circle.setPosition(userLocation);
	  circle.setMap(map);	

//		var lvl=map.getLevel();
//		circle.setRadius(150);
//	  placesNear(1);
}
//user Location

//var userLocation =  new daum.maps.LatLng(37.566826, 126.9786567);
var userLocation;


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
			
			//places near
		  placesNear();
		  
		//전부 다 보기
//			var themeList = document.getElementsByClassName("themeClass");
//			console.log(themeList);
			
//				for (var i = 1; i < themeList.length; i++) {
//					ps.keywordSearch(themeList[i].textContent, placesDrawCB, {
//						location : userLocation,
//						radius : circle.getRadius(),
//						sort : daum.maps.services.SortBy.POPULARITY
//					}); 
//				}
		};

		function error(err) {
		  console.warn('ERROR(' + err.code + '): ' + err.message);
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
//				console.log(se.childNodes.item(0));
				if(se.value!=-1){
					se.childNodes.item(0).selected = true;
					callContents(se.value);
				}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});// end ajax1
}
		
// insertPlan
function insertPlan(index){
	plan_no = document.getElementById('plan_no').value;
	
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
			console.log(document.getElementById('plan_no').value);
			console.log("insertPlan 성공");
			console.log(response.plan_no);
			if(plan_no="-1"){
				var se = document.getElementById('plan_no');
				//se 초기화
				while (se.firstChild) {
					se.removeChild(se.firstChild);
				}
				getMyPlan();
			}else{
				callContents(response.plan_no);
			}

		},
		error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
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
				//console.log(node.nodeName);
				if(node.nodeName=='TR') {
					sP.removeChild(node);
				}
			}
			
			for (var i in response.contentList) {
				var planLi = document.createElement('tr');
				planStr ='<td>'+response.contentList[i].title+'</td>';
				
				planLi.innerHTML = planStr;
				
				sP.appendChild(planLi);
			}

		},
		error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            self.close();
        }
		
	});//end ajax1
	
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
					alert("선택 범위안에 후기글이 없습니다. \n\n"+"첫 번째 관심사를 자동검색합니다.");
					 ps.keywordSearch( themeList[1].textContent, placesSearchCB, {
							location: userLocation,
							radius : circle.getRadius(),	
							sort    : daum.maps.services.SortBy.POPULARITY
					}); 
					 nearOn=false;
				}
				checkOnOff();
			},
			error: function (xhr, textStatus, errorThrown) { console.log(errorThrown); }
		});
	
}


