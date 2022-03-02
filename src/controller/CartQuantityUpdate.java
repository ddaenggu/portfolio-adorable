package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessUpdateCartQuantity;

public class CartQuantityUpdate implements ProductInter{

	static CartQuantityUpdate cqu = new CartQuantityUpdate();
	public static CartQuantityUpdate instance() {
		return cqu;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessUpdateCartQuantity pucq = ProcessUpdateCartQuantity.instance();
		
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
		
		ModelProduct mp = new ModelProduct();
		
		mp.setCart_num(cart_num);
		mp.setCart_quantity(cart_quantity);
		
		pucq.UpdateCartQuantity(mp);
		
		return "selectcart.prod";
	}

}
