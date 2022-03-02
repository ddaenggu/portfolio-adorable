var basePrice = 0;
var baseQuantity = 0;
var allprice = 0;
var point = 0;
$(document).ready(function() {
	var price = document.getElementById("pro_price");
	var quantity = document.getElementById("quantity");
	basePrice = price.value;
	baseQuantity = quantity.value;
	var totalPrice = baseQuantity * basePrice;
	document.getElementById("totalprice").innerText = totalPrice;
	document.getElementById("totalpoint").innerText = totalPrice * 0.01; // 적립금
	allprice += totalPrice;

	document.getElementById("allprice").innerText = allprice; // 총 상품금액
	if (document.getElementById("allprice").innerText >= 50000) { // 상품금액 50000원 이상이면 배송비 0원 아니면 2500원
		document.getElementById("deliveryprice").innerText = 0;
	}
	else {
		document.getElementById("deliveryprice").innerText = 2500;
	}
	
	point = document.getElementById("usepoint");
	if (point.value == "") {
		document.getElementById("usepointzone").innerText = 0;
		document.getElementById("sumprice").innerText = parseInt(document.getElementById("allprice").innerText) + parseInt(document.getElementById("deliveryprice").innerText) - parseInt(document.getElementById("usepointzone").innerText);
			// 총 상품금액 + 배송비 - 포인트사용 = 결제예상금액
	}

	$(".pointbox").focusout(function() {
		if (od.point.value < 5000 || od.usepoint.value < 5000 || parseInt(od.usepoint.value) > parseInt(od.point.value)) {
			alert("포인트는 5000원 이상부터 사용 가능합니다.");
			od.usepoint.value = "";
			document.getElementById("usepointzone").innerText = 0;
			document.getElementById("sumprice").innerText = parseInt(document.getElementById("allprice").innerText) + parseInt(document.getElementById("deliveryprice").innerText) - parseInt(document.getElementById("usepointzone").innerText);
			// 총 상품금액 + 배송비 - 포인트사용 = 결제예상금액
		}
	
		else {
			document.getElementById("usepointzone").innerText = od.usepoint.value;
			document.getElementById("sumprice").innerText = parseInt(document.getElementById("allprice").innerText) + parseInt(document.getElementById("deliveryprice").innerText) - parseInt(document.getElementById("usepointzone").innerText);
			// 총 상품금액 + 배송비 - 포인트사용 = 결제예상금액
		}
	});



	$('#allcarts').click(function() {
		var ischecked = $('#allcarts').prop('checked');
		// allsports선택자의 속성이 체크 = ischecked 변수
		$('input:checkbox[name=carts]').prop('checked', ischecked);
		// input 타입이 checkbox고, 이름이 sports인 선택자. input:태그, type이나 name이나 color 같은건 attr 속성, prop():property, script내에서의 동작에 관한 속성
	});

	$('.detailaddresszone2').hide();

	$('#addr1').on('click', function() {
		$('.detailaddresszone1').show();
		$('.detailaddresszone2').hide();
	});
	$('#addr2').on('click', function() {
		$('.detailaddresszone2').show();
		$('.detailaddresszone1').hide();
	});

});


function findpostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extraaddress").value = extraAddr;

			} else {
				document.getElementById("extraaddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zipcode').value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailaddress").focus();
		}
	}).open();
}

function checkaddr() {
	if (od.orderaddress.value == 'address2') {

		if (od.newdetailaddress.value == '') {
			alert("상세주소를 입력해주세요");
			od.newdetailaddress.focus();
			return false;
		}
		else if (od.newzipcode.value == '') {
			alert("우편번호를 입력해주세요");
			od.newzipcode.focus();
			return false;
		}
		else if (od.newaddress.value == '') {
			alert("주소를 입력해주세요");
			od.newaddress.focus();
			return false;
		}
	}

}