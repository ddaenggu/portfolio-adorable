package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessSelectCart;

public class CartSelect implements ProductInter{

	static CartSelect cs = new CartSelect();
	public static CartSelect instance() {
		return cs;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProcessSelectCart psc = ProcessSelectCart.insatnce();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ModelProduct mp = new ModelProduct();
		mp.setId(id);
		
		List<ModelProduct> list = psc.selectCart(mp);
		request.setAttribute("LIST", list);
		
		return "cart.jsp";
	}

}
