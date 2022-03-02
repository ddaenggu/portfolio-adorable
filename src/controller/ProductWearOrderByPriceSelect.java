package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectWearOrderByPrice;

public class ProductWearOrderByPriceSelect implements ProductInter{

	static ProductWearOrderByPriceSelect pwobps = new ProductWearOrderByPriceSelect();
	public static ProductWearOrderByPriceSelect instance() {
		return pwobps;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectWearOrderByPrice pswobp = ProcessSelectWearOrderByPrice.instance();
		List<ModelProduct> list = pswobp.selectWear();
		request.setAttribute("LIST", list);
		
		return "loginwear.jsp";
	}

}
