package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardListService;
import svc.BoardSelectMineService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class BoardSelectMineAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(); // session 받아오는 법
		String id = (String)session.getAttribute("id");
		
		ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
	  	int page=1;
		int limit=20; // 한 페이지당 20개의 글이 보이도록 설정
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}

		BoardSelectMineService boardSelectMineService = new BoardSelectMineService();
		int listCount=boardSelectMineService.getListCount();
		articleList = boardSelectMineService.getArticleList(id,page,limit);
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
   		forward.setPath("/lookmypetcontent.jsp");
   		return forward;
	}

}
