package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectDress;

public class ProductDressSelect implements ProductInter{

	static ProductDressSelect pds = new ProductDressSelect();
	public static ProductDressSelect instance() {
		return pds;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectDress psd = ProcessSelectDress.instance();
		
		List<ModelProduct> list = psd.selectDress();
		request.setAttribute("LIST", list);
		
		return "loginwear_dress.jsp";
	}

}
