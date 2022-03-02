package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessSelectOneProduct;

public class OneProductSelect implements ProductInter{
	
	static OneProductSelect ops = new OneProductSelect();
	public static OneProductSelect instance() {
		return ops;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectOneProduct psop = ProcessSelectOneProduct.instance();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pro_name = request.getParameter("pro_name");
		String pro_color = request.getParameter("pro_color");
		String pro_size = request.getParameter("pro_size");
		int quantity = Integer.parseInt(request.getParameter("quantity")); // 수량 받아오기
		
		ModelProduct mp = new ModelProduct();
		
		mp.setId(id);
		mp.setPro_name(pro_name);
		mp.setPro_color(pro_color);
		mp.setPro_size(pro_size);
		
		ModelProduct m = psop.selectOneProduct(mp);
		request.setAttribute("m", m);
		request.setAttribute("quantity", quantity); // 수량 다시 전달
		
		return "order.jsp";
	}

}
