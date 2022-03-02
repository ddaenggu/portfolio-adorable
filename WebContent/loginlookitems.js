var basePrice = 0;

$(document).ready(function(){
	
	document.getElementById("pointzone").innerText = parseInt(document.getElementById("pro_price").value) * 0.01;
	
	$('.selecteditem, .totalprice').hide();
	$('#colorID, #sizeID').change(function(){
		var colorID = document.getElementById("colorID").options[document.getElementById("colorID").selectedIndex].value;
		document.getElementById("colortext").innerText = colorID; // selectbox에서 선택한 color값을 colortext안에 넣어줌
		var sizeID = document.getElementById("sizeID").options[document.getElementById("sizeID").selectedIndex].value;
		document.getElementById("sizetext").innerText = sizeID; // selectbox에서 선택한 size값을 sizetext안에 넣어줌
		var quantitybox = document.getElementById("quantitybox").value;
		document.getElementById("quantitytext2").innerText = quantitybox;
		
		if (colorID != "none" && sizeID != "none") {
		$('.selecteditem, .totalprice').show();
		$.ajax({
			url : "getitemprice.jsp?pro_name="+prod.pro_name.value,
			type : "post",
			dataType : "html",
			success : function(data){
				basePrice = parseInt(data);
				var price = basePrice*parseInt(quantitybox);
				
				$("#quantitytext").html(price);
			},
			error : function(){
				alert("error");
			}
		});
		}
		else if (colorID == "none" || sizeID == "none") {
			$('.selecteditem, .totalprice').hide();
		}
	});
	
	$("#quantitybox").change(function(){
		var quantitybox = document.getElementById("quantitybox").value;
		document.getElementById("quantitytext2").innerText = quantitybox;
		var price = basePrice*parseInt(quantitybox);
		$("#quantitytext").html(price);
	});
});

function checkcart() {
	if (prod.pro_size.value == 'none') {
	alert("제품 사이즈를 선택해주세요");
	prod.pro_size.focus();
	return false;
	}
	if (prod.pro_color.value == 'none') {
	alert("제품 색상을 선택해주세요");
	prod.pro_color.focus();
	return false;
	}
	if (prod.id.value == 'null') {
		location.href = "login.jsp";
		return false;
	}
	else {
		return true;
	}
}

