function signup() {
	var id_len = su.id.value.length;
	var pw_len = su.pw.value.length;
	var name_len = su.name.value.length;
	var mail_len = su.mail_front.value.length;
	var idCheckinfo = document.getElementById("idCheckinfo");

	if (id_len < 4) {
		alert("아이디는 4~16자만 사용가능합니다.");
		su.id.value = "";
		su.id.focus();
		su.id.select();
		return false;
	}
	else if (idCheckinfo.innerText == '이미 사용중인 아이디입니다.') {
		alert("아이디 중복확인을 해주세요.");
		su.id.focus();
		su.id.select();
		return false;
	}
	else if (idCheckinfo.innerText == '아이디는 4~16자만 사용가능합니다.') {
		alert("아이디 중복확인을 해주세요.");
		su.id.focus();
		su.id.select();
		return false;
	}
	else if (idCheckinfo.innerText == '사용할 수 없는 아이디입니다.') {
		alert("아이디 중복확인을 해주세요.");
		su.id.focus();
		su.id.select();
		return false;
	}
	else if (pw_len < 4) {
		alert("비밀번호는 4~16자만 사용가능합니다.");
		su.pw.value = "";
		su.pw.focus();
		su.pw.select();
		return false;
	}
	else if (su.pw.value != su.pwcheck.value) {
		alert("비밀번호가 일치하지 않습니다.");
		su.pwcheck.value = "";
		su.pwcheck.focus();
		su.pwcheck.select();
		return false;
	}
	else if (name_len < 2) {
		alert("2자 이상 이름을 입력해주세요.");
		su.name.value = "";
		su.name.focus();
		su.name.select();
		return false;
	}
	else if (su.num_middle.value == '') {
		alert("휴대전화번호를 입력해주세요.");
		su.num_middle.value = "";
		su.num_middle.focus();
		su.num_middle.select();
		return false;
	}
	else if (su.num_back.value == '') {
		alert("휴대전화번호를 입력해주세요.");
		su.num_back.value = "";
		su.num_back.focus();
		su.num_back.select();
		return false;
	}
	else if (su.zipcode.value == '') {
		alert("우편번호를 입력해주세요.");
		su.zipcode.value = "";
		su.zipcode.focus();
		su.zipcode.select();
		return false;
	}
	else if (su.address.value == '') {
		alert("주소를 입력해주세요.");
		su.address.value = "";
		su.address.focus();
		su.address.select();
		return false;
	}
	else if (su.detailaddress.value == '') {
		alert("상세주소를 입력해주세요.");
		su.detailaddress.value = "";
		su.detailaddress.focus();
		su.detailaddress.select();
		return false;
	}
	else if (mail_len < 4) {
		alert("이메일아이디를 4~16자로 입력해주세요.");
		su.mail_front.value = "";
		su.mail_front.focus();
		su.mail_front.select();
		return false;
	}
	else if (su.mail_back.value == '이메일선택') {
		alert("이메일을 선택해주세요.");
		su.mail_back.focus();
		return false;
	}
	else if (su.agree.value == '') {
		alert("약관동의에 동의해주셔야 합니다.");
		return false;
	}
	else if (su.agree.value == '동의하지않음') {
		alert("약관동의에 동의해주셔야 합니다.");
		return false;
	}
	else {
		alert("회원가입이 완료되었습니다. \n아이디 : " + su.id.value + "\n비밀번호 : " + su.pw.value + "\n이름 : " + su.name.value + "\n휴대전화 : " + su.num_front.value + "-" + su.num_middle.value + "-" + su.num_back.value + "\n주소 : " + su.zipcode.value + " " + su.address.value + "\n상세주소 : " + su.detailaddress.value + " " +su.extraaddress.value + "\n이메일 : " + su.mail_front.value + "@" + su.mail_back.value + "\n성별 : " + su.gender.value + "\n반려동물 종류 : " + su.petskind.value);
	}
		
}

function cancel() {
	if (confirm("정말 취소하시겠습니까?") == true) {
		location.href="index.jsp";
	}
	else {
		return;
	}
}

$(function(){
	$("#id").focusout(function(){
		$.ajax({
			url : "idCheck.jsp?id="+id.value,
			type : "post",
			dataType : "html",
			success : function(data){	
				$("#idCheckinfo").html(data);	
			},
			error : function(){
				alert("error");
			}
		});
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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