package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessInsertCart;

public class CartInsert implements ProductInter{
	
	static CartInsert ci = new CartInsert();
	public static CartInsert instance() {
		return ci;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessInsertCart pic = ProcessInsertCart.instance();
		
		String pro_name = request.getParameter("pro_name");
		String pro_size = request.getParameter("pro_size");
		String pro_color = request.getParameter("pro_color");
		int pro_price = Integer.parseInt(request.getParameter("pro_price"));
		int cart_quantity = Integer.parseInt(request.getParameter("quantity"));
		int cart_price = pro_price*cart_quantity;
		HttpSession session = request.getSession(); // session 받아오는 법
		String id = (String)session.getAttribute("id");
		
		ModelProduct mp = new ModelProduct();
		
		mp.setPro_name(pro_name);
		mp.setPro_size(pro_size);
		mp.setPro_color(pro_color);
		mp.setPro_price(pro_price);
		mp.setCart_quantity(cart_quantity);
		mp.setCart_price(cart_price);
		mp.setId(id);
		
		int procode = pic.selectProcode(mp); // procode select해옴
		mp.setPro_code(procode);
		
		pic.insertCart(mp);
		
		return "cartinsertcomplete.jsp";
	}

}
