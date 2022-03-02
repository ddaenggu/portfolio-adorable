function loginok() {
	if (ev.id.value == 'null') {
		location.href = "login.jsp";
		return false;
	}
	else {
		return true;
	}
}