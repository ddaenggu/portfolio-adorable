$(document).ready(function() {
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

