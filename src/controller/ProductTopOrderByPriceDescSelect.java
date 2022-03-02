package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectTopOrderByPriceDesc;

public class ProductTopOrderByPriceDescSelect implements ProductInter{
	
	static ProductTopOrderByPriceDescSelect ptobpds = new ProductTopOrderByPriceDescSelect();
	public static ProductTopOrderByPriceDescSelect instance() {
		return ptobpds;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectTopOrderByPriceDesc pstobpd = ProcessSelectTopOrderByPriceDesc.instance();
		
		List<ModelProduct> list = pstobpd.selectTop();
		request.setAttribute("LIST", list);
		
		return "loginwear_top.jsp";
	}

}
