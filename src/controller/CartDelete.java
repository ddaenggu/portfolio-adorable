package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessDeleteCart;

public class CartDelete implements ProductInter{

	static CartDelete cd = new CartDelete();
	public static CartDelete instance() {
		return cd;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessDeleteCart pdc = ProcessDeleteCart.instance();
		
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		
		ModelProduct mp = new ModelProduct();
		
		mp.setCart_num(cart_num);
		
		pdc.deleteCart(mp);
		
		return "selectcart.prod";
	}

}
