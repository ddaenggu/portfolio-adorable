package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectDressOrderByName;

public class ProductDressOrderByNameSelect implements ProductInter{
	
	static ProductDressOrderByNameSelect pdobns = new ProductDressOrderByNameSelect();
	public static ProductDressOrderByNameSelect instance() {
		return pdobns;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProcessSelectDressOrderByName psdobn = ProcessSelectDressOrderByName.instance();

		List<ModelProduct> list = psdobn.selectDress();
		request.setAttribute("LIST", list);
		
		return "loginwear_dress.jsp";
	}

}
