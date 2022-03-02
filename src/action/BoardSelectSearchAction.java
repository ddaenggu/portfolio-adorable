package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardSelectMineService;
import svc.BoardSelectSearchService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class BoardSelectSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String search = request.getParameter("search");
		
		ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
	  	int page=1;
		int limit=20; // 한 페이지당 20개의 글이 보이도록 설정
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		BoardSelectSearchService boardSelectSearchService = new BoardSelectSearchService();
		int listCount=boardSelectSearchService.getListCount();
		articleList = boardSelectSearchService.getArticleList(search,page,limit);
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	    int endPage = startPage+20-1;

   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		ActionForward forward= new ActionForward();
   		forward.setPath("/searchwithmypet.jsp");
   		return forward;
	}

}
