package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectToy;

public class ProductToySelect implements ProductInter{
	
	static ProductToySelect pts = new ProductToySelect();
	public static ProductToySelect instance() {
		return pts;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectToy pst = ProcessSelectToy.instance();
		List<ModelProduct> list = pst.selectToy();
		request.setAttribute("LIST", list);
		
		return "toy.jsp";
	}

}
