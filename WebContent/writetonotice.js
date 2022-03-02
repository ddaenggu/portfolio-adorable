function cancel() {
	if (confirm("정말 취소하시겠습니까?") == true) {
		location.href="adminNoticeBoardList.board";
	}
	else {
		return;
	}
}

function writeOK() {
	if (bd.board_title.value == '') {
		alert("제목을 입력해주세요");
		bd.board_title.focus();
		return false;
	}
	if (bd.board_content.value == '') {
		alert("내용을 입력해주세요");
		bd.board_content.focus();
		return false;
	}
}