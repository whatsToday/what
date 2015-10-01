function changeColor(Obj) {
    Obj.style.backgroundColor = '#FED4DE';
    Obj.onmouseout = function(){
        Obj.style.backgroundColor = '#FFFFFF';
    }
}

function themeSearch(Obj) {
	
	//var themeName = Obj.id.split("_").pop();
	var themeName = Obj;

	//$('#theme_Name_'+Obj).className = 'selectedTheme';
	
	circle.setMap(null);
	circle.setPosition(userLocation);
	//circle.setRadius(distance*1000);
	circle.setRadius(150);
	circle.setMap(map);	
	
	ps.keywordSearch(themeName, placesSearchCB, {
	
		location: userLocation,
		radius : 150,	
		sort    : daum.maps.services.SortBy.POPULARITY
		
		//daum.maps.services.SortBy.DISTANCE
		//daum.maps.services.SortBy.POPULARITY 인기순
		//daum.maps.services.ImageFilter.ONLY 이미지가 있는놈들만	
		//daum.maps.services.ImageFilter.NOT 이미지가 없는놈들만
		//daum.maps.services.ImageFilter.ALL 
	});
	
	
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
		  userLocation=new daum.maps.LatLng(crd.latitude, crd.longitude);
		  map.setCenter(userLocation);

searchPlaces();
		  //주변 3km내에 있는 content getcha! 		  
		//placesNear(1);
			
		};

		function error(err) {
		  console.warn('ERROR(' + err.code + '): ' + err.message);
		};
		
		
		
		
//getMyPlan
function getMyPlan() {
	$.ajax({
		type : "Post",
		url : "/getMyPlan",
		data : {

		},
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
			console.log(sP.childNodes);

		},
		error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            self.close();
        }
		
	});//end ajax1
	
}



