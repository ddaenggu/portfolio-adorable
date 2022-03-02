function loginok() {
	if (lb.id.value == 'null') {
		location.href = "login.jsp";
		return false;
	}
	else {
		return true;
	}
}

function writeok() {
	if (lb.lb_title.value == '') {
		alert("제목을 입력해주세요");
		lb.lb_title.focus();
		return false;
	}
	else if (lb.lb_content.value == '') {
		alert("내용을 입력해주세요");
		lb.lb_content.focus();
		return false;
	}
	else if (lb.lb_img.value == '') {
		alert("이미지를 올려주세요");
		return false;
	}
	
	if (lb.proname.length == null) {
		if (!lb.proname.checked) {
			alert("룩북에서 착용한 제품을 선택해주세요");
			return false;
		}
	}
	else {
		var cnt = 0;
		for (var i = 0; i < lb.proname.length; i++) { // 제품이 for문 돌때마다 체크되면 cnt++
			if (lb.proname[i].checked) {
				cnt++;
			}
		}
		if (cnt == 0) { // 제품이 하나도 체크가 안됐을 때
			alert("룩북에서 착용한 제품을 선택해주세요");
			return false;
		}
	}

}

$(document).ready(function() {

	$("#likeempty").on("click", function() {
		$.ajax({
			url: "likeup.jsp?id=" + lb.id.value + "&lb_num=" + lb.lb_num.value,
			type: "post",
			dataType: "html",
			success: function(data) {
				location.href = 'lookbookdetail.jsp?lb_num=' + lb.lb_num.value;
			},
			error: function() {
				alert("error");
			}
		});
	});

	$("#likefull").on("click", function() {
		$.ajax({
			url: "likedown.jsp?id=" + lb.id.value + "&lb_num=" + lb.lb_num.value,
			type: "post",
			dataType: "html",
			success: function(data) {
				location.href = 'lookbookdetail.jsp?lb_num=' + lb.lb_num.value;
			},
			error: function() {
				alert("error");
			}
		});
	});

});

function delreply() {
	if (confirm("정말 삭제하시겠습니까?") == true) {
		location.href = "processlookbookreplydelete.jsp?reply_num=" + lb.reply_num.value + "&lb_num=" + lb.lb_num.value;
	}
	else {
		return;
	}
}
