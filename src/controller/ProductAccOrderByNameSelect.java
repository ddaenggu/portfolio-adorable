package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectAccOrderByName;

public class ProductAccOrderByNameSelect implements ProductInter{
	
	static ProductAccOrderByNameSelect paobns = new ProductAccOrderByNameSelect();
	public static ProductAccOrderByNameSelect instance() {
		return paobns;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectAccOrderByName psaobn = ProcessSelectAccOrderByName.instance();
		
		List<ModelProduct> list = psaobn.selectAcc();
		request.setAttribute("LIST", list);
		
		return "loginwear_acc.jsp";
	
	}

}
