function cancel() {
	if (confirm("정말 취소하시겠습니까?") == true) {
		location.href="boardDetailSelect.board?board_num="+bd.board_num.value+"&page="+bd.page.value;
	}
	else {
		return;
	}
}

function writeOK() {
	if (bd.reply_content.value == '') {
		alert("댓글을 입력해주세요");
		bd.reply_content.focus();
		return false;
	}
}