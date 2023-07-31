<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- ======= Header ======= -->
<jsp:include page = "header_css.jsp"></jsp:include>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=a17ohflrnj&callback=initMap"></script>
    <link rel="stylesheet" href="./assets/css/tranggle.css" />
<!-- ======= Header End======= -->
</head>
<body>

<!-- ======= Header ======= -->
<jsp:include page = "header.jsp"></jsp:include> 
<!-- ======= Header End======= -->
  <main id="main">
	  <section id="breadcrumbs" class="breadcrumbs">
	  <input type="hidden" id="maps" value="${maps}"/> 
		<div class="container">
		   <div class="course">
		      <div class="course_left">
		         <div class="section">
		            <div class="top_title" style="background-color: #ffc451; color:white;">등산 코스</div>
		            <div class="option_tag">
		               <!---->
		               <span class="option_choice">
		                  <a href="#">
		                     <!----><!----><!----><!----><!----><!---->
		                  </a>
		               </span>
		            </div>
		         </div>
		         <!---->
		         <div class="left_content" style="height: calc(100vh - 245px);">
		            <div class="list_poi">
			            <ul id="list_ul" style="margin:0px;padding:0px">
			            </ul>
		            </div>
		            <!-- <div class="list_page"><a href="#" class="i_left"></a><a href="#" class="on">1</a><a href="#" class="">2</a><a href="#" class="">3</a><a href="#" class="">4</a><a href="#" class="">5</a><a href="#" class="i_right"></a></div> -->
		         </div>
		      </div>
		      <div class="content">
		         <div id="naver_map" style="width: 100%; height: 100%;">
		         </div>
		         <!---->
		         <div class="map_lnb">
		            <!----><!---->
		         </div>
		         <!---->
		         <!-- <div class="map_fnb"><a href="#"><span class="map_btn_refresh">현위치 코스보기</span></a></div> -->
		      </div>
		   </div>
	       <script type="text/javascript">

		    	var data  = '${maps}';
		    	var naver_map = null;
		        var markers = new Array();
		    	var info_windows = new Array()
		    	var polyline;	//폴리라인
		
		        function initMap() {	//지도 초기화
		      
		        	var datas = JSON.parse(data);
		
		        	naver_map = new naver.maps.Map('naver_map', {
		                center: new naver.maps.LatLng(datas[0].lat, datas[0].lng),	//위도 경도 좌표로 가운데 시작
		                zoom:14
		            });
		        	
		        	datas.forEach(function(marker, idx){	//datas에 값 부여
		        		
		        		markers.push(new naver.maps.Marker({
		                    		title: marker.trackName,
		                            position: new naver.maps.LatLng(marker.lat, marker.lng),
		                            map: naver_map
		                        }));
		        		
		    			var info_windows_html = [];
		    			info_windows_html.push('<div class="info_window">');
		    			info_windows_html.push('   <div class="course_info">');    
		    			info_windows_html.push('            <span class="info_td2">');          
		    			info_windows_html.push('				<span class="poi_info">');            
		    			info_windows_html.push('					<span class="subject"><span class="i_sports_walking i_m"></span>');
		    			info_windows_html.push('						<span class="text elp">'+ marker.trackName +'</span></span>');            
		    			info_windows_html.push('						<span class="data">');              
		    			info_windows_html.push('						<span class="info_distance">'+ convertMetersToKilometers(marker.distance) + ' km</span>');              
		    			info_windows_html.push('						<span class="info_time">'+ convertTimeFormat(marker.totalTime) + '</span>');
		    			info_windows_html.push('					</span>');        
		    			info_windows_html.push('				</span>');        
		    			info_windows_html.push('            </span>');     
		    			info_windows_html.push('   </div>');
		    			info_windows_html.push('</div>')
		    			
		        		info_windows.push(new naver.maps.InfoWindow({
		        			content : info_windows_html.join('')
		        	 	}));
		    	
		        	});
		
					
		           	markers.forEach(function(marker, index){		//마커를 누르면
		           		
		           		naver.maps.Event.addListener(marker, 'click', getClickHandler(index)); 
		           		
		                naver.maps.Event.addListener(marker, 'click', function() {
		                    if (polyline) {
		                        polyline.setMap(null);
		                        polyline = null;
		                    }
		                    var polyline_path = [];
		                  	datas[index].course.forEach(function(x){
		                  		polyline_path.push(new naver.maps.LatLng(x.lat, x.lon));
		                  	});
		                 	
		                     polyline = new naver.maps.Polyline({
		                         map: naver_map,
		                         path: polyline_path,
		                         strokeColor: '#FF0000', // 폴리라인의 선 색상
		                         strokeWeight: 3 // 폴리라인의 선 두께
		                     });
		                });
		       		});
		        
		        	var list_html = [];
					datas.forEach(function(marker, idx){
		    			list_html.push('<li id="list_'+(idx+1)+'" class="list_map" data-idx="'+idx+'">');
		    			list_html.push('<span class="td1"><span class="poi_pin">'+(idx+1)+'</span></span>');
		    			list_html.push('<span class="td3">');
		    			list_html.push('<span class="t_icon">');
		    			list_html.push('   <span class="i_s i_sports_running"></span>');
		    			list_html.push('   <div class="user_file">');
		    			list_html.push('   </div>');
		    			list_html.push('</span>');
		    			list_html.push('<span class="poi_content">');
		    			list_html.push('   <span class="subject"><span class="text elp">'+ marker.trackName +'</span></span><span class="data"><span class="text"><span class="t1">전체 거리</span>'+ convertMetersToKilometers(marker.distance) + ' km</span><span class="text"><span class="t1">전체 시간</span>'+ convertTimeFormat(marker.totalTime) + '</span><span class="text"><span class="t1">평균 속도</span>'+ marker.averSpeed.toFixed(1) +' km/h</span></span>');
		    			list_html.push('</span>');
		    			list_html.push('</span>');
		    			list_html.push('</li>');
		        	});
								
					document.getElementById('list_ul').innerHTML = list_html.join('');
					document.querySelectorAll('.list_map').forEach(function(x){
						x.addEventListener("click", getClickHandler(x.dataset['idx'], datas[x.dataset['idx']]));	
		               	x.addEventListener('click', function() {
		                  if (polyline) {
		                      polyline.setMap(null);
		                      polyline = null;
		                  }
		                  var polyline_path = [];
		               	datas[x.dataset['idx']].course.forEach(function(x){
		                		polyline_path.push(new naver.maps.LatLng(x.lat, x.lon));
		                	});
		                   polyline = new naver.maps.Polyline({
		                       map: naver_map,
		                       path: polyline_path,
		                       strokeColor: '#FF0000', // 폴리라인의 선 색상
		                       strokeWeight: 3 // 폴리라인의 선 두께
		                   });
		                    
		                });
		               	
					});
		        }
		 
		        function convertMetersToKilometers(distance){
		        	return Math.ceil(distance / 1000);
		        }
		        
		        function convertTimeFormat(minutes){
		       	  	return new Date(minutes * 60 * 1000).toISOString().substr(11, 8);
		        }
		        
		        function getClickHandler(seq, marker) {
		        
		            return function(e) {
		                var marker = markers[seq]
		                var info_window = info_windows[seq];
		                if (info_window.getMap()) {
		                	info_window.close();
		                } else {
		                	info_window.open(naver_map, marker);
		                }
		    		}
		    	}
		        
	    </script>
		</div>
	</section>
  </main><!-- End #main -->

   <!-- ======= Footer ======= -->
<jsp:include page = "footer.jsp"></jsp:include>

</body>
</html>