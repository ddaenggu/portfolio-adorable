package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelProduct;
import mybatis.ProcessSelectRecommend;

public class RecommendSelect implements ProductInter{
	
	static RecommendSelect rs = new RecommendSelect();
	public static RecommendSelect instance() {
		return rs;
	}

	@Override
	public String productData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ProcessSelectRecommend psr = ProcessSelectRecommend.instance();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ModelProduct mp = new ModelProduct();
		mp.setId(id);
		
		String petskind = psr.selectPetskind(mp);
		mp.setPetskind(petskind);
		
		if (petskind.equals("강아지") || petskind.equals("고양이")) {
			List<ModelProduct> list = psr.selectRecommend(mp);
			request.setAttribute("list", list);
		}
		else {
			List<ModelProduct> list = psr.selectAllRecommend();
			request.setAttribute("list", list);
		}
		
		return "recommend.jsp";
	}

}
