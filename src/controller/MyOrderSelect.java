package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessSelectMyOrder;

public class MyOrderSelect implements ProductInter{

	static MyOrderSelect mos = new MyOrderSelect();
	public static MyOrderSelect instance() {
		return mos;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectMyOrder psmo = ProcessSelectMyOrder.instance();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ModelProduct mp = new ModelProduct();
		
		mp.setId(id);
		
		List<ModelProduct> list = psmo.selectMyOrder(mp);
		List<ModelProduct> arr = psmo.selectOrdercode(mp);
		request.setAttribute("LIST", list);
		request.setAttribute("arr", arr);
		
		return "myorder.jsp";
	}

}
