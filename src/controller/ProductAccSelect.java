package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;
import mybatis.ProcessSelectAcc;

public class ProductAccSelect implements ProductInter{
	
	static ProductAccSelect pas = new ProductAccSelect();
	public static ProductAccSelect instance() {
		return pas;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectAcc psa = ProcessSelectAcc.instance();
		
		List<ModelProduct> list = psa.selectAcc();
		request.setAttribute("LIST", list);
		
		return "loginwear_acc.jsp";
	}

}
