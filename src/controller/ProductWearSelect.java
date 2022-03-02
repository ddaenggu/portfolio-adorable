package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectWear;

public class ProductWearSelect implements ProductInter{
	
	static ProductWearSelect pws = new ProductWearSelect();
	public static ProductWearSelect instance() {
		return pws;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectWear psw = ProcessSelectWear.instance();
		List<ModelProduct> list = psw.selectWear();
		request.setAttribute("LIST", list);
		
		return "loginwear.jsp";
	}

}
