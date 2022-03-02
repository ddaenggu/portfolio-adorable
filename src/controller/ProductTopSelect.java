package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectTop;

public class ProductTopSelect implements ProductInter{

	static ProductTopSelect pts = new ProductTopSelect();
	public static ProductTopSelect instance() {
		return pts;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectTop pst = ProcessSelectTop.instance();
		
		List<ModelProduct> list = pst.selectTop();
		request.setAttribute("LIST", list);
		
		return "loginwear_top.jsp";
	}

}
