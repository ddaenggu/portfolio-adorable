package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessSelectRecommendOrderByPriceDesc;

public class RecommendSelectOrderByPriceDesc implements ProductInter{

	static RecommendSelectOrderByPriceDesc rsobpd = new RecommendSelectOrderByPriceDesc();
	public static RecommendSelectOrderByPriceDesc instance() {
		return rsobpd;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectRecommendOrderByPriceDesc psrobpd = ProcessSelectRecommendOrderByPriceDesc.instance();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ModelProduct mp = new ModelProduct();
		mp.setId(id);
		
		String petskind = psrobpd.selectPetskind(mp);
		mp.setPetskind(petskind);
		
		if (petskind.equals("강아지") || petskind.equals("고양이")) {
			List<ModelProduct> list = psrobpd.selectRecommend(mp);
			request.setAttribute("list", list);
		}
		else {
			List<ModelProduct> list = psrobpd.selectAllRecommend();
			request.setAttribute("list", list);
		}
		
		return "recommend.jsp";
	}

}
