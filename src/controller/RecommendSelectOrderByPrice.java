package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessSelectRecommendOrderByPrice;

public class RecommendSelectOrderByPrice implements ProductInter{
	
	static RecommendSelectOrderByPrice rsobp = new RecommendSelectOrderByPrice();
	public static RecommendSelectOrderByPrice instance() {
		return rsobp;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectRecommendOrderByPrice psrobp = ProcessSelectRecommendOrderByPrice.instance();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ModelProduct mp = new ModelProduct();
		mp.setId(id);
		
		String petskind = psrobp.selectPetskind(mp);
		mp.setPetskind(petskind);
		
		if (petskind.equals("강아지") || petskind.equals("고양이")) {
			List<ModelProduct> list = psrobp.selectRecommend(mp);
			request.setAttribute("list", list);
		}
		else {
			List<ModelProduct> list = psrobp.selectAllRecommend();
			request.setAttribute("list", list);
		}
		
		return "recommend.jsp";
	}

}
