package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectAccOrderByPriceDesc;

public class ProductAccOrderByPriceDescSelect implements ProductInter {

	static ProductAccOrderByPriceDescSelect paobpds = new ProductAccOrderByPriceDescSelect();
	public static ProductAccOrderByPriceDescSelect instance() {
		return paobpds;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProcessSelectAccOrderByPriceDesc psaobpd = ProcessSelectAccOrderByPriceDesc.instance();
		
		List<ModelProduct> list = psaobpd.selectAcc();
		request.setAttribute("LIST", list);
		
		return "loginwear_acc.jsp";
	}

}
