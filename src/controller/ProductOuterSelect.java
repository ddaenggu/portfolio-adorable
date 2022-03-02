package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectOuter;

public class ProductOuterSelect implements ProductInter{
	
	static ProductOuterSelect pos = new ProductOuterSelect();
	public static ProductOuterSelect instance() {
		return pos;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectOuter pso = ProcessSelectOuter.instance();
		List<ModelProduct> list = pso.selectOuter();
		request.setAttribute("LIST", list);
		
		return "loginwear_outer.jsp";
		
	}

}
