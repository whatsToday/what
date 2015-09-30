
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
console.log("userLocation = "+userLocation);


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
			console.log(response.MyPlanList);
			console.log(response.MyPlanList[0]);

			var se = document.getElementById('plan_no');
			if(response.MyPlanList[0]!=undefined){
				console.log("일정이 있습니다!");
				for ( var i in response.MyPlanList) {
					var pvo = response.MyPlanList[i];
					var op = document.createElement("option");
					op.value = pvo.plan_no;
					op.innerHTML = pvo.planName;
					op.selected = true;
	
					se.appendChild(op);
				}
			}else{
				console.log("일정이 없습니다!");
				var op = document.createElement("option");
				op.value='-1';
				op.innerHTML = '오늘의 일정이 없습니다.';
				op.selected = true;
				
				se.appendChild(op);
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
	console.log(plan_no);
	
	items=placesArray[index];
	console.log(items);
	
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
			console.log("insertPlan 성공");
			
			callContents(plan_no);
			

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
			console.log("callContents 성공");
			
			var sP =document.getElementById('showPlan');
			
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























//onclick="insertPlan(items.phone,items.newAddress,items.imageUrl,items.direction,items.zipcode,items.placeUrl,items.id,items.title,items.category,items.address,items.longitude,items.latitude,items.addressBCode+'); return false;" >찜 하기</a></td></tr>';



//location.href="/insertPlan?phone='+items.phone+'&newAddress='+items.newAddress+'&imageUrl='+items.imageUrl+'&direction='+items.direction+'&zipcode='+items.zipcode+'&placeUrl='+items.placeUrl+'&id='+items.id+'&title='+items.title+'&category='+items.category+'&address='+items.address+'&longitude='+items.longitude";
//	content += '&latitude='+items.latitude+'&addressBCode='+items.addressBCode+'" onclick="history.back">찜 하기</a></td></tr>';
	

//function insertPlan(phone,newAddress,imageUrl,direction,zipcode,placeUrl,id,title,category,address,longitude,latitude,addressBCode){
//console.log("!");
//	//console.log(phone,newAddress,imageUrl,direction,zipcode,placeUrl,id,title,category,address,longitude,latitude,addressBCode);
//	
//}

//찜하기
//content += '<td onclick="insertPlan()">찜 하기</td>'
//	content += '<td><a href="/insertPlan?phone='+items.phone+'&newAddress='+items.newAddress+'&imageUrl='+items.imageUrl;
//	content += '&direction='+items.direction+'&zipcode='+items.zipcode+'&placeUrl='+items.placeUrl+'&id='+items.id;
//	content += '&title='+items.title+'&category='+items.category+'&address='+items.address+'&longitude='+items.longitude;
//	content += '&latitude='+items.latitude+'&addressBCode='+items.addressBCode+'" onclick="history.back">찜 하기</a></td></tr>';

	//content += '<td data-items="/insertPlan?phone='+items.phone+'&newAddress='+items.newAddress+'&imageUrl='+items.imageUrl+'&direction='+items.direction+'&zipcode='+items.zipcode+'&placeUrl='+items.placeUrl+'&id='+items.id+'&title='+items.title+'&category='+items.category+'&address='+items.address+'&longitude='+items.longitude+'&latitude='+items.latitude+'&addressBCode='+items.addressBCode+'" onclick=insertPlan(this);></td>'

//content += '<td onclick="insertPlan('+items.phone+','+items.newAddress+','+items.imageUrl+','+items.direction+','+items.zipcode+','+items.placeUrl+','+items.id+','+items.title+','+items.category+','+items.address+','+items.longitude+','+items.latitude+','+items.addressBCode+')">찜하기</td>'
//console.log(items.phone);
		

