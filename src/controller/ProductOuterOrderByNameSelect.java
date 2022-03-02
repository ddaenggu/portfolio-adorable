package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectOuterOrderByName;

public class ProductOuterOrderByNameSelect implements ProductInter{

	static ProductOuterOrderByNameSelect poobns = new ProductOuterOrderByNameSelect();
	public static ProductOuterOrderByNameSelect instance() {
		return poobns;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectOuterOrderByName psoobn = ProcessSelectOuterOrderByName.instance();
		
		List<ModelProduct> list = psoobn.selectOuter();
		request.setAttribute("LIST", list);
		
		return "loginwear_outer.jsp";
		
	}

}
