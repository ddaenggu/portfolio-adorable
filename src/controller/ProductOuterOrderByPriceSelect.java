package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectOuterOrderByPrice;

public class ProductOuterOrderByPriceSelect implements ProductInter{

	static ProductOuterOrderByPriceSelect poobps = new ProductOuterOrderByPriceSelect();
	public static ProductOuterOrderByPriceSelect instance() {
		return poobps;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectOuterOrderByPrice psoobp = ProcessSelectOuterOrderByPrice.instance();
		
		List<ModelProduct> list = psoobp.selectOuter();
		request.setAttribute("LIST", list);
		
		return "loginwear_outer.jsp";
	}

}
