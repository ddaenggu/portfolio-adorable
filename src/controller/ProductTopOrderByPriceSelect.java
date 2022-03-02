package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectTopOrderByPrice;

public class ProductTopOrderByPriceSelect implements ProductInter{

	static ProductTopOrderByPriceSelect ptobps = new ProductTopOrderByPriceSelect();
	public static ProductTopOrderByPriceSelect instance() {
		return ptobps;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectTopOrderByPrice pstobp = ProcessSelectTopOrderByPrice.instance();
		
		List<ModelProduct> list = pstobp.selectTop();
		request.setAttribute("LIST", list);
		
		return "loginwear_top.jsp";
	}

}
