var basePrice = 0;
var baseQuantity = 0;
var allprice = 0;
var cart = 0;

$(document).ready(function() {
	var price = document.getElementsByClassName("pro_price");
	var quantity = document.getElementsByClassName("quantitybox"); // 배열이기 때문에 getElementsByClassName
	//var carts = document.getElementsByClassName("carts");
	for (var i = 0; i < price.length; i++) {
		basePrice = price[i].value;
		baseQuantity = quantity[i].value;
		var totalPrice = baseQuantity * basePrice;
		document.getElementsByClassName("totalprice")[i].innerText = totalPrice;
		document.getElementsByClassName("totalpoint")[i].innerText = totalPrice * 0.01; // 적립금
		allprice += totalPrice; // 카트 총 상품금액 += 제품수량 * 제품가격
	}
	

	document.getElementById("allprice").innerText = allprice; // 총 상품금액
	if (document.getElementById("allprice").innerText >= 50000) { // 상품금액 50000원 이상이면 배송비 0원 아니면 2500원
		document.getElementById("deliveryprice").innerText = 0;
	}
	else {
		document.getElementById("deliveryprice").innerText = 2500;
	}

	document.getElementById("sumprice").innerText =
	 parseInt(document.getElementById("allprice").innerText) + parseInt(document.getElementById("deliveryprice").innerText);
	// 총 상품금액 + 배송비 = 결제예상금액


	$(".quantitybox").change(function() {
		var price = document.getElementsByClassName("pro_price");
		var quantity = document.getElementsByClassName("quantitybox");
		for (var i = 0; i < quantity.length; i++) {
			basePrice = price[i].value;
			baseQuantity = quantity[i].value;
			var totalPrice = baseQuantity * basePrice;
			document.getElementsByClassName("totalprice")[i].innerText = totalPrice;
			document.getElementsByClassName("totalpoint")[i].innerText = totalPrice * 0.01;
		}

	});


	/*$('#allcarts').click(function() {
		var ischecked = $('#allcarts').prop('checked');
		// allsports선택자의 속성이 체크 = ischecked 변수
		$('input:checkbox[name=carts]').prop('checked', ischecked);
		// input 타입이 checkbox고, 이름이 sports인 선택자. input:태그, type이나 name이나 color 같은건 attr 속성, prop():property, script내에서의 동작에 관한 속성
	});*/
	
	/*$('.each_class').each(function(){
	if ($("input:checkbox[name=carts]").is(":checked")) {
		$('#pro_code').prop('disabled',false);
		$('#pro_name').prop('disabled',false);
		$('#pro_price').prop('disabled',false);
		$('#cart_quantity').prop('disabled',false);
		
	}
	else {
		$('#pro_code').prop('disabled',true);
		$('#pro_name').prop('disabled',true);
		$('#pro_price').prop('disabled',true);
		$('#cart_quantity').prop('disabled',true);
	}
});*/

});