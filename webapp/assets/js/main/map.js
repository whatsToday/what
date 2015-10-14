var markers = [];
var mapContainer = document.getElementById('map'),
    mapOption = { center: new daum.maps.LatLng(37.566826, 126.9786567), level: 3 };  
var map = new daum.maps.Map(mapContainer, mapOption); 

navigator.geolocation.getCurrentPosition(success, error, options);

var ps = new daum.maps.services.Places();  
var infowindow = new daum.maps.InfoWindow({zIndex:1});
var infowindow2 = new daum.maps.InfoWindow({zIndex:1});
var placesArray = [];
var markKeeper = {
	marks : [],
	theme : [],
	loc : userLocation
};

var circle = new daum.maps.Circle({
	strokeWeight: 3, // 선의 두께입니다 
    strokeColor: '#69ABED', // 선의 색깔입니다
    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'shortdashdot', // 선의 스타일 입니다
    fillColor: '#FFFAFC', // 채우기 색깔입니다
    fillOpacity: 0.2  // 채우기 불투명도 입니다  
//    radius : 150
});

var polyline = new daum.maps.Polyline({
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#FFAE00', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});
//////////////////////////////////////////////////////////////
var dfd = $.Deferred();


function searchPlaces() {
    var keyword = document.getElementById('keyword').value;
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    console.log("1");
    
    ps.keywordSearch( keyword, placesSearchCB, {
	
//		location: map.getCenter(),
//		radius : cirecle.getRadius(),	
		sort    : daum.maps.services.SortBy.ACCURACY
		
		//daum.maps.services.SortBy.ACCURACY 
		//daum.maps.services.SortBy.DISTANCE
		//daum.maps.services.SortBy.POPULARITY 인기순
		//daum.maps.services.ImageFilter.ONLY 이미지가 있는놈들만	
		//daum.maps.services.ImageFilter.NOT 이미지가 없는놈들만
		//daum.maps.services.ImageFilter.ALL 
	}); 
    insertKey(keyword); 
}
function searchPlaces2() {
    var keyword = document.getElementById('keyword').value;
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    console.log("2");
    ps.keywordSearch( keyword, placesSearchCB, {
	
		location: circle.getPosition(),
		radius : circle.getRadius(),	
		sort    : daum.maps.services.SortBy.ACCURACY
		
		//daum.maps.services.SortBy.ACCURACY 
		//daum.maps.services.SortBy.DISTANCE
		//daum.maps.services.SortBy.POPULARITY 인기순
		//daum.maps.services.ImageFilter.ONLY 이미지가 있는놈들만	
		//daum.maps.services.ImageFilter.NOT 이미지가 없는놈들만
		//daum.maps.services.ImageFilter.ALL 
	}); 
    insertKey(keyword); 
}

function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {
    	var r = $.Deferred();
    	
        displayPlaces(data.places);
        displayPagination(pagination);
        
        mapResult =true;
        console.log("2222222222            Success");
//        dfd.resolve();
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
    	alertModal('지도 검색 결과가 존재하지 않습니다.'); 
    	console.log("2222222222            zero-Result");
//    	clearMarkTheme();
    	mapResult =false; 
    	return;
    } else if (status === daum.maps.services.Status.ERROR) { 
    	alert('지도 검색 결과 중 오류가 발생했습니다.');  
    	mapResult =false; 
    	return;
    }
}

function displayPlaces(places) {
	placesArray = places;
	polyline.setMap(null);
	
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    removeAllChildNods(listEl);
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
        
        bounds.extend(placePosition);

        
        (function(marker, i) {

        	$.ajax({
        		url:'/markerColor',
        		data : {
        			id : places[i].id
        		},
        		success : function(response){
        			if(response.color=='purple'){
        				purpleMarker(marker, i);
        			}
        			if(response.color=='green'){
        				greenMarker(marker, i);
        			}
        		},
        		error: function (xhr, textStatus, errorThrown) { console.log(errorThrown); },
        	});
        	
            
        })(marker, i);
        
        
        
        (function(marker, items, num) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, items);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
            	map.setCenter(marker.getPosition());
                displayInfowindow(marker, items);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
            //click
            daum.maps.event.addListener(marker, 'click', function(){
            	infowindow.close();
            	displayInfowindow2(marker, items, num);
            });
            
            itemEl.onclick = function(){
            	map.setLevel(4);
            	map.setCenter(new daum.maps.LatLng(items.latitude, items.longitude));
            	infowindow.close();
            	displayInfowindow2(marker, items, num);//index추가할까
            };
            
            
        })(marker, places[i], i);
        
        fragment.appendChild(itemEl);
        
    }
    
    daum.maps.event.addListener(map, 'click',
    		function(){
    	infowindow.close();
    	infowindow2.close();
    });
    
    $('body').click(function() {
    	infowindow.close();
    	infowindow2.close();   
    });
    
    daum.maps.event.addListener(map, 'rightclick', function(mouseEvent) {
        userLocation = mouseEvent.latLng;
        changeLocation();
        placesNear();
    });
    
    ///////////

    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    map.setBounds(bounds);
}

function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>';

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

function addMarker(position, idx, title) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

function displayInfowindow(marker, items) {
	var content = '<div class="wsTable" style="width:200px;"><table><tr><th class="wshd">'+items.title+'</th></tr><table></div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

function displayInfowindow2(marker, items, index) {
	var content = '<div class="wsTable effect" style="width:200px;"><table><tr><th class="wshd" colspan="2">'+items.title+'</th></tr>';
	
	//찜하기
	content += '<tr><td onclick="insertPlan('+index+');"> 찜하기 </td>';
	
	
		//좋아요, 갯글, 플랜
			$.ajax({
				type: "Post",
				url: "/getInfo",
				data:{
					id : items.id
				},
				success: function(response){
					
					//event 유무 확인
					if(response.event){
						content += '<td onclick="contentView('+index+');">상세 정보<img width="20px" src="/assets/img/sale.png"/></td></tr>';
					}else{
						content += '<td onclick="contentView('+index+');">상세 정보</td></tr>';
					}
					
					//좋아요 갯수, 댓글 갯수 
					content += '<tr><td>'+'&hearts; = '+response.good+'</td><td> 댓글 = '+response.comments+'</td></tr>';
					
					//플랜 수집3223
					content += '<tr><th class="wshd" colspan="2">블로그 후기</th></tr></table><div class="scrollist"><table>';
					
						if(response.planList.length!=0){
							for ( var i in response.planList) {
								//follow
								var followw = false;
								for ( var j in response.followList) {
									if(response.followList[j].followNum==response.planList[i].member_no){
										followw = true;
									}
								}
								if(followw){
									content += '<tr><td colspan="2" id="'+response.planList[i].plan_no+'" onclick="showplan(this)">';
									content += response.planList[i].memberName+'님의 <b>'+response.planList[i].plan_no+'</b> 번 후기   <img width="20px" src="/assets/img/follow.png"/></td></tr>';
								}else{
									content += '<tr><td colspan="2" id="'+response.planList[i].plan_no+'" onclick="showplan(this)">';
									content += response.planList[i].memberName+'님의 <b>'+response.planList[i].plan_no+'</b> 번 후기   </td></tr>';
								}
							}
							
						}else{
							content += '<tr><td colspan="2">후기가 없습니다</td></tr>';
						}
							
						content+='</table></div></div>';
						
						infowindow2.setContent(content);
						infowindow2.open(map, marker);
						
						
				},
				error:function(jqXHR, textStatus, errorThrown){
					alertModal('에러 발생~~ \n' + textStatus + " : " + errorThrown);
		            self.close();
		        }//end ajax
				
	});//end display window 2
	
}

function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

