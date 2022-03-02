package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectTopOrderByName;

public class ProductTopOrderByNameSelect implements ProductInter{

	static ProductTopOrderByNameSelect ptobns = new ProductTopOrderByNameSelect();
	public static ProductTopOrderByNameSelect instance() {
		return ptobns;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectTopOrderByName pstobn = ProcessSelectTopOrderByName.instance();
		
		List<ModelProduct> list = pstobn.selectTop();
		request.setAttribute("LIST", list);
		
		return "loginwear_top.jsp";
		
	}

}
