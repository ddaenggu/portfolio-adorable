package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectOuterOrderByPriceDesc;

public class ProductOuterOrderByPriceDescSelect implements ProductInter{

	static ProductOuterOrderByPriceDescSelect poobpds = new ProductOuterOrderByPriceDescSelect();
	public static ProductOuterOrderByPriceDescSelect instance() {
		return poobpds;
	}
 	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProcessSelectOuterOrderByPriceDesc psoobpd = ProcessSelectOuterOrderByPriceDesc.instance();
		
		List<ModelProduct> list = psoobpd.selectOuter();
		request.setAttribute("LIST", list);
		
		return "loginwear_outer.jsp";
	}

}
