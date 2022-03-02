package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectDressOrderByPriceDesc;

public class ProductDressOrderByPriceDescSelect implements ProductInter{
	
	static ProductDressOrderByPriceDescSelect pdobpds = new ProductDressOrderByPriceDescSelect();
	public static ProductDressOrderByPriceDescSelect instance() {
		return pdobpds;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ProcessSelectDressOrderByPriceDesc psdobpd = ProcessSelectDressOrderByPriceDesc.instance();
		
		List<ModelProduct> list = psdobpd.selectDress();
		request.setAttribute("LIST", list);
		
		return "loginwear_dress.jsp";
	
	}

}
