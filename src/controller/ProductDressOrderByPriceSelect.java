package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectDressOrderByPrice;

public class ProductDressOrderByPriceSelect implements ProductInter{
	
	static ProductDressOrderByPriceSelect pdobps = new ProductDressOrderByPriceSelect();
	public static ProductDressOrderByPriceSelect instance() {
		return pdobps;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectDressOrderByPrice psdobp = ProcessSelectDressOrderByPrice.instance();
		
		List<ModelProduct> list = psdobp.selectDress();
		request.setAttribute("LIST", list);
		
		return "loginwear_dress.jsp";
	}

}
