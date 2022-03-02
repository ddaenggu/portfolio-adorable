<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="model.ModelHotel" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<link rel="stylesheet" type="text/css" href="hoteldetail.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="hotelroom.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a0e18e0375455969654b6a91b8204b2&libraries=services"></script>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

if (id == null) {
	%>
	<jsp:include page="indexheader.jsp"/>
	<%
}
else {
	%>
	<jsp:include page="loginindexheader.jsp"/>
	<%
}
%>
	
	<jsp:useBean id="hotel" class="controller.HotelController"/>
	<%
	String hotelname = request.getParameter("hotelname");
	int hotelcode = Integer.parseInt(request.getParameter("hotelcode"));
	ModelHotel m = new ModelHotel();
	m.setHotelname(hotelname);
	ModelHotel mh = hotel.selectHotelInfo(m);
	ModelHotel img = hotel.selectHotelImage(m);
	int minprice = hotel.selectMinPrice(hotelcode);
	%>
	<section>
	<form action="hotelroom.jsp" name="hotel">
	<div class="hotelshape">
	<div class="hoteltitle">
	HOTEL
	<div class="hotelsubtitle"><%= mh.getHotelname() %></div>
	</div>
	<input type="hidden" name="hotelname" value="<%= hotelname %>">
	<input type="hidden" name="hotelcode" value="<%= hotelcode %>">
	<input type="hidden" name="id" value="<%= id %>">
	<div class="priceinfo">객실 시작가 ~<%= minprice %> 원<input type="submit" value="예약하러가기" class="bookbtn" onclick="return loginok()"></div>
	<div class="hotelinfo">
	<ul>
	<li><img src="imgfile/<%= img.getHotel_img() %>" width="820px" height="600px"></li>
	<li>
	<div class="hoteldetailinfo">
	<div class="hotelname"><%= mh.getHotelname() %></div>
	<%= mh.getHoteladdress() %> <br>
	<%= mh.getHotelnum() %>
	</div>
	<div id="map" style="width:450px;height:300px;"></div>
	</li>
	</ul>
	</div>
	
	</div>
	</form>
	</section>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%= mh.getHoteladdress() %>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%= mh.getHotelname() %></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	<footer>
		<div class="foottitle">
			<div class="ftleft">
				<div class="ft1">COMPANY ㈜adorable
					<div class="ft1_1">
						대표자. 백현민 <br>
						tel. 010-7430-6757 <br>
						business no. 123-45-6789 <br>
						mail. bhm01@naver.com <br>
						address. 서울특별시 관악구 관악로
					</div>
				</div>
				<div class="ft2">C/S CENTER
					<div class="ft1_1">
						<h3>070-1234-5678</h3><br>
						mon-fri am11:00-pm5:00 <br>
						lunch pm12:00-pm1:00 <br>
						sat, sun, holiday off
					</div>
				</div>
			</div>
			<div class="ftright">
				<div class="ft1">BANK ACCOUNT
					<div class="ft1_1">
						농협 123-1234-5678-90 <br>
						신한은행 123-4567-890 <br><br>
						예금주 : ㈜어도러블
					</div>
				</div>
				<div class="ft2">SOCIAL LINK
					<div class="ft1_1">
						<a href="https://www.instagram.com/ddddanggu/" target="_blank"><img src="image/instalogo.png" width="50px" height="50px"></a>
						<a href="https://www.facebook.com/" target="_blank"><img src="image/facebooklogo.png" width="50px" height="50px"></a>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>