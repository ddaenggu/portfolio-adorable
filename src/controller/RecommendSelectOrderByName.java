package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessSelectRecommendOrderByName;

public class RecommendSelectOrderByName implements ProductInter{

	static RecommendSelectOrderByName rsobn = new RecommendSelectOrderByName();
	public static RecommendSelectOrderByName instance() {
		return rsobn;
	}
	
	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProcessSelectRecommendOrderByName psrobn = ProcessSelectRecommendOrderByName.instance();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ModelProduct mp = new ModelProduct();
		mp.setId(id);
		
		String petskind = psrobn.selectPetskind(mp);
		mp.setPetskind(petskind);
		
		if (petskind.equals("강아지") || petskind.equals("고양이")) {
			List<ModelProduct> list = psrobn.selectRecommend(mp);
			request.setAttribute("list", list);
		}
		else {
			List<ModelProduct> list = psrobn.selectAllRecommend();
			request.setAttribute("list", list);
		}
		
		return "recommend.jsp";
	}

}
