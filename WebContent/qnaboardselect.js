function deletecontent() {
	if (confirm("정말 삭제하시겠습니까?") == true) {
		location.href="processwritedelete.jsp?board_num="+bd.board_num.value;
	}
	else {
		return;
	}
}