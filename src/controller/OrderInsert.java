package controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessInsertOrder;

public class OrderInsert implements ProductInter{
	
	static OrderInsert oi = new OrderInsert();
	public static OrderInsert instance() {
		return oi;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProcessInsertOrder pio = ProcessInsertOrder.instance();
		
		String order_zipcode = null;
		String order_address = null;
		String order_detailaddress = null;
		String order_extraaddress = null;
		int order_deliveryprice = 0;
		int order_usepoint = 0;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int pro_code = Integer.parseInt(request.getParameter("pro_code"));
		int pro_price = Integer.parseInt(request.getParameter("pro_price"));
		int order_quantity = Integer.parseInt(request.getParameter("quantity"));
		int point = (pro_price * order_quantity) / 100 ;
		if (pro_price * order_quantity < 50000) { // 배송비 결정하는 조건문
			order_deliveryprice = 2500;
		}
		else {
			order_deliveryprice = 0;
		}
		
		if (request.getParameter("order_usepoint") == "") { // order_usepoint 부분이 비어있으면 포인트 0
			order_usepoint = 0;
		}
		else {
			order_usepoint = Integer.parseInt(request.getParameter("order_usepoint"));
			point = point-order_usepoint; // 포인트 사용했으면 적립될 포인트 = 포인트-쓴포인트, 그래서 customer update할 때 금액 마이너스 되게
		}
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		
		if (request.getParameter("orderaddress").equals("address1")) {
			order_zipcode = request.getParameter("zipcode");
			order_address = request.getParameter("address");
			order_detailaddress = request.getParameter("detailaddress");
			order_extraaddress = request.getParameter("extraaddress");
		}
		else {
			order_zipcode = request.getParameter("newzipcode");
			order_address = request.getParameter("newaddress");
			order_detailaddress = request.getParameter("newdetailaddress");
			order_extraaddress = request.getParameter("newextraaddress");
		}
		
		int max = pio.selectMaxOrderNum();
		
		String date = formatedNow+""+max;
		
		ModelProduct mp = new ModelProduct();
		
		mp.setId(id);
		mp.setPro_code(pro_code);
		mp.setOrder_quantity(order_quantity);
		mp.setOrder_deliveryprice(order_deliveryprice);
		mp.setOrder_usepoint(order_usepoint);
		mp.setOrdercode(date);
		mp.setOrder_zipcode(order_zipcode);
		mp.setOrder_address(order_address);
		mp.setOrder_detailaddress(order_detailaddress);
		mp.setOrder_extraaddress(order_extraaddress);
		mp.setPoint(point);

		pio.insertOrder(mp);
		pio.updateProduct(mp);
		pio.updatePoint(mp);
		
		return "orderComplete.jsp";
	}

}
