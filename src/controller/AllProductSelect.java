package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessSelectAllProduct;

public class AllProductSelect implements ProductInter{
	
	static AllProductSelect aps = new AllProductSelect();
	public static AllProductSelect instance() {
		return aps;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectAllProduct psap = ProcessSelectAllProduct.instance();
		
		ArrayList<ModelProduct> list = new ArrayList<ModelProduct>();
		ModelProduct mid = new ModelProduct();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String [] pro_code = request.getParameterValues("pro_code");
		String [] pro_name = request.getParameterValues("pro_name");
		String [] quan = request.getParameterValues("cart_quantity");
	
		for (int i = 0; i < pro_code.length; i++) {
			ModelProduct mp = new ModelProduct();
			mp.setPro_code(Integer.parseInt(pro_code[i]));
			mp.setPro_name(pro_name[i]);
			
			list.add(mp);
		}
		mid.setId(id);
		ModelProduct m = psap.selectCustomer(mid);
		List<ModelProduct> arr =psap.selectAllProduct(list);
		
		ArrayList<Integer> quantity = new ArrayList<Integer>();
		for (int i = 0; i < quan.length; i++) {
			quantity.add(Integer.parseInt(quan[i]));
		}
		
		request.setAttribute("m", m);
		request.setAttribute("arr", arr);
		request.setAttribute("quantity", quantity);
		
//		int [] quantity = null;
//		quantity = new int[quan.length];
//		for (int i = 0; i < quan.length; i++) {
//			quantity[i] = Integer.parseInt(quan[i]);
//		}
		
		
		return "orderall.jsp";
	}

}
