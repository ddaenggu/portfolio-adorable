var basePrice = 0;
var baseQuantity = 0;
var allprice = 0;
var point = 0;
$(document).ready(function() {
	var price = document.getElementById("price");
	basePrice = price.value;
	var totalPrice = basePrice;
	document.getElementById("totalpoint").innerText = totalPrice * 0.01; // 적립금
	allprice = totalPrice;

	document.getElementById("allprice").innerText = allprice; // 총 상품금액

	point = document.getElementById("usepoint");
	if (point.value == "") {
		document.getElementById("usepointzone").innerText = 0;
		document.getElementById("sumprice").innerText = parseInt(document.getElementById("allprice").innerText) - parseInt(document.getElementById("usepointzone").innerText);
		// 총 상품금액 + 배송비 - 포인트사용 = 결제예상금액
	}
	
	$(".pointbox").focusout(function() {
		if (ht.point.value < 5000 || ht.usepoint.value < 5000 || parseInt(ht.usepoint.value) > parseInt(ht.point.value)) {
			alert("포인트는 5000원 이상부터 사용 가능합니다.");
			ht.usepoint.value = "";
			document.getElementById("usepointzone").innerText = 0;
			document.getElementById("sumprice").innerText = parseInt(document.getElementById("allprice").innerText) - parseInt(document.getElementById("usepointzone").innerText);
			// 총 상품금액 + 배송비 - 포인트사용 = 결제예상금액
		}
		else {
			document.getElementById("usepointzone").innerText = ht.usepoint.value;
			document.getElementById("sumprice").innerText = parseInt(document.getElementById("allprice").innerText) - parseInt(document.getElementById("usepointzone").innerText);
			// 총 상품금액 + 배송비 - 포인트사용 = 결제예상금액
		}
	});





});