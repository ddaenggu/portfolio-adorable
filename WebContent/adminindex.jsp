<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adorable</title>
	<link rel="stylesheet" type="text/css" href="index.css">
	<link rel="stylesheet" type="text/css" href="loginindex.css">
	<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
</head>
<body>
	<header>
		<div class="fixtitle">
			<div class="menu">
				<ul>
					<li class="customerName"><a href="#">${admin_name}</a></li>
					<li> | </li>
					<li class="menudetail"><a href="processlogout.jsp">LOGOUT</a></li>
					<li> | </li>
					<li class="menudetail"><a href="#">ADMINPAGE</a></li>
				</ul>
			</div>
			<div class="title">
				<div class="adorable"><a href="adminindex.jsp">adorable</a></div>
			</div>
				<div class="list">
					<ul class="mainlist">
						<li><a href="#" class="mlfirst"><img src="image/dogfoot.png" width="50px" height="50px"></a></li>
						<li><a href="#" class="ml6">BEST</a></li>
						<li><a href="#" class="ml7">RECOMMEND</a></li>
						<li><a href="adminwear.jsp" class="ml1">WEAR</a>
							<div class="triangle tri1"></div>
							<ul class="sublist sb1">
								<li><a href="adminwear.jsp">아우터</a></li>
								<li><a href="#">탑/티셔츠</a></li>
								<li><a href="#">올인원/원피스</a></li>
								<li><a href="#">악세사리</a></li>
							</ul>
						</li>
						<li><a href="#" class="ml2">TOY</a>
							<div class="triangle tri2"></div>
							<ul class="sublist sb2">
								<li><a href="#">봉제장난감</a></li>
								<li><a href="#">터그놀이</a></li>
								<li><a href="#">낚시대</a></li>
								<li><a href="#">스크래쳐</a></li>
							</ul>
						</li>
						<li><a href="#" class="ml3">OTHER ITEMS</a>
							<div class="triangle tri3"></div>
							<ul class="sublist sb3">
								<li><a href="#">간식</a></li>
								<li><a href="#">배변패드/모래</a></li>
								<li><a href="#">산책</a></li>
								<li><a href="#">하우스</a></li>
							</ul>
						</li>
						<li><a href="#" class="ml8">LOOKBOOK</a></li>
						<li><a href="#" class="ml9">EVENT</a></li>
						<li><a href="#" class="ml10">HOTEL</a></li>
						<li><a href="#" class="ml4">COMMUNITY</a>
							<div class="triangle tri4"></div>
							<ul class="sublist sb4">
								<li><a href="#">Q&A</a></li>
								<li><a href="#">반려동물 일기</a></li>
							</ul>
						</li>
						<li><a href="adminNoticeBoardList.board" class="ml5">ADORABLE NEWS</a>
							<div class="triangle tri5"></div>
							<ul class="sublist sb5">
								<li><a href="adminNoticeBoardList.board">공지사항</a></li>
							</ul>
						</li>
						<li><a href="#"><img src="image/catfoot.png" width="50px" height="50px"></a></li>
					</ul>
				</div>
		</div>
	</header>

	<section>
		<div class="mainbanner">
			<figure>
				<img src="image/mainbanner1.JPEG">
				<img src="image/mainbanner2.JPEG">
				<img src="image/mainbanner3.JPEG">
				<img src="image/mainbanner4.JPEG">
				<img src="image/mainbanner1.JPEG">
			</figure>
		</div>
			<div class="sec">
			<div class="circlebanner">
				<div class="cbleft">
					<a href="#">
					<div class="cb1">
						<div class="cbimg">
							<img src="image/wear.PNG">
						</div>
					</div>
					</a>
					<a href="#">
					<div class="cb2">
						<div class="cbimg">
							<img src="image/toy.PNG">
						</div>
					</div>
					</a>
				</div>
				<div class="cbright">
					<a href="#">
					<div class="cb3">
						<div class="cbimg">
							<img src="image/items.PNG">
						</div>
					</div>
					</a>
					<a href="#">
					<div class="cb4">
						<div class="cbimg">
							<img src="image/event.PNG">
						</div>
					</div>
					</a>
				</div>
			</div>
			<div class="hotelbanner">
				<h2>HOTEL</h2>
				<div class="hb">
					<div class="hbimg">
						<a href="#"><img src="image/hotelbanner1.jpeg" width="640px" height="400px"><img src="image/hotelbanner2.png" width="640px" height="400px"></a>
						<div class="hbmessage">
						<a href="#">HOTEL 구경하러가기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="newsbanner">
				<div class="nb1">
					<a href="#" class="nb1_2 nbtitle">NOTICE & NEWS</a>
					<div class="nb1_1">
						<div class="nbleft">
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
							<a href="#" class="nb1_2">오늘의 공지사항입니다.</a><br>
						</div>
						<div class="nbright">
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
						</div>
					</div>
				</div>
				<div class="nb1">
					<a href="#" class="nb1_2 nbtitle">COMMUNITY</a>
					<div class="nb1_1">
						<div class="nbleft">
							<a href="#" class="nb1_2">우리집강아지사진 올리고가요~</a><br>
							<a href="#" class="nb1_2">반려동물 동반식당 추천해요</a><br>
							<a href="#" class="nb1_2">강아지놀이터 다녀왔어요!</a><br>
							<a href="#" class="nb1_2">주인님 자는중 zzZ</a><br>
							<a href="#" class="nb1_2">집사님들 캣타워 추천해주세요</a><br>
							<a href="#" class="nb1_2">주인님 사진 올리고갑니다!!</a><br>
						</div>
						<div class="nbright">
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
							<a href="#" class="nb1_2">2021-12-02</a><br>
						</div>
					</div>
				</div>
				<div class="nb2">
					<a href="#" class="nb1_2 nbtitle">LOOKBOOK</a>
					<div class="nb2_1">
						<a href="#"><img src="image/lookbook1.JPEG" width="200px" height="180px"><img src="image/lookbook2.JPEG" width="200px" height="180px"></a>
					</div>
				</div>
			</div>
			<div class="productbanner1">
				<div class="bp">RECOMMEND PRODUCT</div>
				<ul>
					<li>
						<div class="pb1">
						<a href="#">
							<img src="image/product1_1.png" class="pbimg1" width="300px" height="300px">
							<img src="image/product1_2.png" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="#">겨울겨울 산타옷 올인원</a></div>
						<div class="pb3">39,000원</div>
					</li>
					<li>
						<div class="pb1">
						<a href="#">
							<img src="image/product2_1.png" class="pbimg1" width="300px" height="300px">
							<img src="image/product2_2.png" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="#">겨울겨울 산타모자</a></div>
						<div class="pb3">21,000원</div>
					</li>
					<li>
						<div class="pb1">
						<a href="#">
							<img src="image/product3_1.png" class="pbimg1" width="300px" height="300px">
							<img src="image/product3_2.png" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="#">딸기 하네스</a></div>
						<div class="pb3">34,000원</div>
					</li>
					<li>
						<div class="pb1">
						<a href="#">
							<img src="image/product4_1.png" class="pbimg1" width="300px" height="300px">
							<img src="image/product4_2.png" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="#">바스락 식빵 장난감</a></div>
						<div class="pb3">11,000원</div>
					</li>
				</ul>
			</div>
			<div class="productbanner2">
				<div class="bp">BEST PRODUCT</div>
				<ul>
					<li>
						<div class="pb1">
						<a href="#">
							<img src="image/product7_1.png" class="pbimg1" width="300px" height="300px">
							<img src="image/product7_2.png" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="#">낚시대 나무 스크래쳐</a></div>
						<div class="pb3">11,000원</div>
					</li>
					<li>
						<div class="pb1">
						<a href="#">
							<img src="image/product5_1.png" class="pbimg1" width="300px" height="300px">
							<img src="image/product5_2.png" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="#">물고기 낚시대</a></div>
						<div class="pb3">7,000원</div>
					</li>
					<li>
						<div class="pb1">
						<a href="#">
							<img src="image/product6_1.png" class="pbimg1" width="300px" height="300px">
							<img src="image/product6_2.png" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="#">3단 베이직 계단</a></div>
						<div class="pb3">79,000원</div>
					</li>
					<li>
						<div class="pb1">
						<a href="#">
							<img src="image/product1_1.png" class="pbimg1" width="300px" height="300px">
							<img src="image/product1_2.png" class="pbimg2" width="300px" height="300px">
						</a>
						</div>
						<div class="pb2"><a href="#">겨울겨울 산타옷 올인원</a></div>
						<div class="pb3">39,000원</div>
					</li>
				</ul>
			</div>
		</div>
	</section>

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