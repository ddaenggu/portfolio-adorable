function checkwrite() {
	if (mp.mypet_content.value == '') {
		alert("내용을 입력해주세요");
		mp.mypet_content.focus();
		return false;
	}
	else if (mp.mypet_img.value == '') {
		alert("이미지를 업로드해주세요");
		return false;
	}
}

function checkdelete() {
	if (confirm("정말 삭제하시겠습니까?") == true) {
		location.href="processdeletemypet.jsp?mypet_num="+mp.mypet_num.value;
	}
	else {
		return;
	}
}