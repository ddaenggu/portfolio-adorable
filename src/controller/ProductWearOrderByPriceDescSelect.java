package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectWearOrderByPriceDesc;

public class ProductWearOrderByPriceDescSelect implements ProductInter{

	static ProductWearOrderByPriceDescSelect pwobpds = new ProductWearOrderByPriceDescSelect();
	public static ProductWearOrderByPriceDescSelect instance() {
		return pwobpds;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectWearOrderByPriceDesc pswobpd = ProcessSelectWearOrderByPriceDesc.instance();
		List<ModelProduct> list = pswobpd.selectWear();
		request.setAttribute("LIST", list);
		
		return "loginwear.jsp";
	}

}
