package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardSelectService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardUpdateFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		BoardSelectService boardSelectService = new BoardSelectService();
		BoardBean article = boardSelectService.getArticle(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
		request.setAttribute("article", article);
   		forward.setPath("/withmypetupdate.jsp");
   		
   		return forward;
	}

}
