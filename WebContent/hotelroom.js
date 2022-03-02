$(document).ready(function() {
	var today = new Date();
	today.setDate(today.getDate()+1);
	var today2 = new Date();
	var dd = today2.getDate();
	var mm = today2.getMonth()+1;
	var yyyy = today2.getFullYear();
	if (dd < 10) {
		dd = '0' + dd
	}
	if (mm < 10) {
		mm = '0' + mm
	}
	today2 = yyyy+'-'+mm+'-'+dd;
	
	document.getElementById('checkin').valueAsDate = new Date(); // checkin 기본값 = 오늘
	document.getElementById('checkout').valueAsDate = today; // checkout 기본값 = 오늘+1
	
	document.getElementById('checkin').setAttribute("min", today2); // checkin, checkout 최소값 = 오늘
	document.getElementById('checkout').setAttribute("min", today2);
	
	$('#checkin, #checkout').focusout(function(){
	if (hotel.checkin_date.value >= hotel.checkout_date.value) {
		// 체크인날짜가 체크아웃날짜보다 이후일 경우
		hotel.checkout_date.value = "";
		hotel.checkout_date.focus();
	}
		
	});

});

function checkdate() {
	if (hotel.checkin_date.value >= hotel.checkout_date.value) {
		// 체크인날짜가 체크아웃날짜보다 이후일 경우
		hotel.checkout_date.value = "";
		hotel.checkout_date.focus();
		return false;
	}
}

function loginok() {
	if (hotel.id.value == 'null') {
		location.href = "login.jsp";
		return false;
	}
	else {
		return true;
	}
}
