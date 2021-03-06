<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adorable</title>
<link href="https://fonts.googleapis.com/css2?family=Hammersmith+One&family=Playfair+Display:ital@1&family=Staatliches&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="signup.css">
	<link rel="stylesheet" type="text/css" href="indexheaderfooter.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="indexheader.js"></script>
	<script type="text/javascript" src="signup.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

<section>
	<form name="su" action="signupinsert.jsp" method="post">
		<h1>
			<img src="image/jointitle1.PNG" width="60px" height="60px">
			<b class="jointitle">JOIN US</b>
			<img src="image/jointitle2.PNG" width="60px" height="60px">
		</h1><br>
		<div>
		<table width="600px">
			<th align="left">
				<b><font size="4">기본정보</font></b>
				<div class="mustinput"><b class="star">*</b>필수입력사항</div>
			</th>
			<tr><td class="line"></td></tr>
			<th align="left">
				아이디 <b class="star">*</b>
			</th>
			<tr>
				<td class="line" height="30">
					<input type="text" size="30" name="id" class="borderline" maxlength="16" placeholder="영문소문자/숫자, 4~16자" id="id">
					<span id="idCheckinfo"></span>
				</td>
			</tr>
			<th align="left">
				비밀번호 <b class="star">*</b>
			</th>
			<tr>
				<td class="line" height="30">
					<input type="password" size="30" name="pw" class="borderline" maxlength="16" placeholder="영문소문자/숫자/특수문자, 4~16자">
				</td>
			</tr>
			<th align="left">
				비밀번호확인 <b class="star">*</b>
			</th>
			<tr>
				<td class="line" height="30">
					<input type="password" size="30" name="pwcheck" class="borderline" maxlength="16">
				</td>
			</tr>
			<th align="left">
				이름 <b class="star">*</b>
			</th>
			<tr>
				<td class="line" height="30">
					<input type="text" size="30" name="name" class="borderline">
				</td>
			</tr>
			<th align="left">
				휴대전화 <b class="star">*</b>
			</th>
			<tr>
				<td class="line" height="30">
					<select class="selbox" name="num_front">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
						<option value="018">018</option>
						<option value="017">017</option>
						<option value="016">016</option>
					</select>
					<input type="text" size="10" name="num_middle" class="borderline" maxlength="4">
					<input type="text" size="10" name="num_back" class="borderline" maxlength="4">
				</td>
			</tr>
			<th align="left">
				주소 <b class="star">*</b>
			</th>
			<tr>
				<td>
					<input type="text" size="6" name="zipcode" class="borderline" placeholder="우편번호" id="zipcode">
					<input type="text" size="35" name="address" class="borderline" placeholder="주소" id="address">
					<input type="button" name="findaddr" value="주소찾기" class="bt" onclick="findpostcode()">
				</td>
			</tr>
			<tr>
				<td class="line" height="30">
					<input type="text" size="40" name="detailaddress" class="borderline" placeholder="상세주소" id="detailaddress">
					<input type="text" size="20" name="extraaddress" class="borderline" placeholder="참고항목" id="extraaddress">
				</td>
			</tr>
			<th align="left">
				이메일 <b class="star">*</b>
			</th>
			<tr>
				<td class="line" height="30">
					<input type="text" size="20" name="mail_front" class="borderline">
					@
					<select class="selbox" name="mail_back">
						<option selected>이메일선택</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="daum.net">daum.net</option>
					</select>
				</td>
			</tr>
		</table><br>
		<table width="600px">
			<th align="left">
				<b><font size="4">추가정보</font></b>
			</th>
			<tr><td class="line"></td></tr>
			<th align="left">
				집사 성별
			</th>
			<tr>
				<td class="line" height="30">
					<input type="radio" name="gender" value="여" checked> 여
					<input type="radio" name="gender" value="남"> 남
				</td>
			</tr>
			<th align="left">
				반려동물 종류
			</th>
			<tr>
				<td class="line" height="30">
					<select class="selbox" name="petskind">
						<option value="없음" selected>없음</option>
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
					</select>
				</td>
			</tr>
			
		</table><br><br>
		<table width="600px">
			<th align="center">
				<b><font size="4">약관동의</font></b>
			</th>
			<tr>
				<td align="center">
					<textarea rows="10" cols="80" class="clause">1. 개인정보 수집목적 및 이용목적

가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산

콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스

나. 회원 관리

회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달

2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보

3. 개인정보의 보유기간 및 이용기간

원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.

가. 회사 내부 방침에 의한 정보 보유 사유

o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 5년

나. 관련 법령에 의한 정보보유 사유

o 계약 또는 청약철회 등에 관한 기록

-보존이유 : 전자상거래등에서의소비자보호에관한법률

-보존기간 : 5년

o 대금 결제 및 재화 등의 공급에 관한 기록

-보존이유: 전자상거래등에서의소비자보호에관한법률

-보존기간 : 5년

o 소비자 불만 또는 분쟁처리에 관한 기록

-보존이유 : 전자상거래등에서의소비자보호에관한법률

-보존기간 : 3년

o 로그 기록

-보존이유: 통신비밀보호법

-보존기간 : 3개월

※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.
					</textarea>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="radio" name="agree" value="동의함"> 동의함
					<input type="radio" name="agree" value="동의하지않음"> 동의하지않음
				</td>
			</tr>
		</table><br><br>
		<table>
			<tr>
				<td>
					<input type="submit" value="가입하기" class="joinbt" onclick="return signup()">
					<input type="button" value="취소" class="cancelbt" onclick="return cancel()">
				</td>
			</tr>
		</table>
		<div class="joinimage">
			<img src="image/dogfood.png" width="60px" height="60px">
			<img src="image/catfoot.png" width="60px" height="60px">
			<img src="image/dogborn.png" width="60px" height="60px">
			<img src="image/dogtoy.png" width="60px" height="60px">
			<img src="image/dogfoot.png" width="60px" height="60px">
			<img src="image/catcan.png" width="60px" height="60px">
		</div>
		</div>
	</form>
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