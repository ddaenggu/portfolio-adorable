package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectWearOrderByName;

public class ProductWearOrderByNameSelect implements ProductInter{

	static ProductWearOrderByNameSelect pwobns = new ProductWearOrderByNameSelect();
	public static ProductWearOrderByNameSelect instance() {
		return pwobns;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectWearOrderByName pswobn = ProcessSelectWearOrderByName.instance();
		List<ModelProduct> list = pswobn.selectWear();
		request.setAttribute("LIST", list);
		
		return "loginwear.jsp";
	}

}
