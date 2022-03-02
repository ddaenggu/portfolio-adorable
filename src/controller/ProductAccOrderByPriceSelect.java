package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectAccOrderByPrice;

public class ProductAccOrderByPriceSelect implements ProductInter{
	
	static ProductAccOrderByPriceSelect paobps = new ProductAccOrderByPriceSelect();
	public static ProductAccOrderByPriceSelect instance() {
		return paobps;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectAccOrderByPrice psaobp = ProcessSelectAccOrderByPrice.instance();
	
		List<ModelProduct> list = psaobp.selectAcc();
		request.setAttribute("LIST", list);
		
		return "loginwear_acc.jsp";
	
	}

}
