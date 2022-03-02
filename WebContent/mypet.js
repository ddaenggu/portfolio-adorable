function cancel() {
	if (confirm("친구요청을 취소하시겠습니까?") == true) {
		location.href="processcancelfriend.jsp?friendid="+mp.friendid.value+"&search="+mp.search.value;
	}
	else {
		return;
	}
}

function deletefriend() {
	if (confirm("친구삭제를 하시겠습니까?") == true) {
		location.href="processdeletefriend.jsp?friendid="+mp.friendid.value+"&search="+mp.search.value;
	}
	else {
		return;
	}
}
