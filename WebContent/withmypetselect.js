function deletecontent() {
	if (confirm("정말 삭제하시겠습니까?") == true) {
		location.href="boardDeletePro.board?board_num="+bd.board_num.value+"&page="+bd.page.value;
	}
	else {
		return;
	}
}

function deletereply() {
	if (confirm("정말 삭제하시겠습니까?") == true) {
		location.href="replyDeletePro.board?board_num="+bd.board_num.value+"&reply_num="+bd.reply_num.value+"&page="+bd.page.value;
	}
	else {
		return;
	}
}