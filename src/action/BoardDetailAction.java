package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean article = boardDetailService.getArticle(board_num);
		articleList = boardDetailService.getReplyArticleList(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
	   	request.setAttribute("articleList", articleList);
   		forward.setPath("/withmypetselect.jsp");
   		return forward;
	}

}
