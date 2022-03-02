package controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessInsertAllOrder;

public class AllOrderInsert implements ProductInter {

	static AllOrderInsert aoi = new AllOrderInsert();

	public static AllOrderInsert instance() {
		return aoi;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessInsertAllOrder piao = ProcessInsertAllOrder.instance();

		ArrayList<ModelProduct> list = new ArrayList<ModelProduct>();
		ModelProduct m = new ModelProduct();

		String order_zipcode = null;
		String order_address = null;
		String order_detailaddress = null;
		String order_extraaddress = null;
		int order_deliveryprice = 0;
		int order_usepoint = 0;

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String[] procode = request.getParameterValues("pro_code"); // value 여러개를 받아오기 위해서 string으로 받고 for문을 통해 형변환을 해줌
		String[] proprice = request.getParameterValues("pro_price");
		String[] orderquantity = request.getParameterValues("quantity");
		int[] pro_price = new int[proprice.length];
		int[] order_quantity = new int[orderquantity.length];
		int totalprice = 0;


		for (int i = 0; i < proprice.length; i++) { // 상품 총합 구하기
			pro_price[i] = Integer.parseInt(proprice[i]);
			order_quantity[i] = Integer.parseInt(orderquantity[i]);
			totalprice += pro_price[i] * order_quantity[i];
		}

		int point = totalprice / 100;
		if (totalprice < 50000) { // 배송비 결정하는 조건문
			order_deliveryprice = 2500;
		} else {
			order_deliveryprice = 0;
		}

		if (request.getParameter("order_usepoint") == "") { // order_usepoint 부분이 비어있으면 포인트 0
			order_usepoint = 0;
		} else {
			order_usepoint = Integer.parseInt(request.getParameter("order_usepoint"));
			point = point-order_usepoint;
		}

		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);

		if (request.getParameter("orderaddress").equals("address1")) {
			order_zipcode = request.getParameter("zipcode");
			order_address = request.getParameter("address");
			order_detailaddress = request.getParameter("detailaddress");
			order_extraaddress = request.getParameter("extraaddress");
		} else {
			order_zipcode = request.getParameter("newzipcode");
			order_address = request.getParameter("newaddress");
			order_detailaddress = request.getParameter("newdetailaddress");
			order_extraaddress = request.getParameter("newextraaddress");
		}
		
		int max = piao.selectMaxOrderNum();

		String date = formatedNow + "" + max;
		
		for (int i = 0; i < procode.length; i++) {
			ModelProduct mp = new ModelProduct();
			mp.setPro_code(Integer.parseInt(procode[i]));
			mp.setPro_price(Integer.parseInt(proprice[i]));
			mp.setOrder_quantity(Integer.parseInt(orderquantity[i]));
			mp.setId(id);
			mp.setOrder_deliveryprice(order_deliveryprice);
			mp.setOrder_usepoint(order_usepoint);
			mp.setOrdercode(date);
			mp.setOrder_zipcode(order_zipcode);
			mp.setOrder_address(order_address);
			mp.setOrder_detailaddress(order_detailaddress);
			mp.setOrder_extraaddress(order_extraaddress);

			list.add(mp);
		}

		
		m.setPoint(point);
		m.setId(id);	
		piao.insertOrder(list);
		piao.updateProduct(list);
		piao.updatePoint(m);
		piao.deleteCart(list);

		return "orderComplete.jsp";
	}

}
