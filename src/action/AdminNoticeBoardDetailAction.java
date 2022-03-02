package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.NoticeBoardDetailService;
import vo.ActionForward;
import vo.NoticeDTO;

public class AdminNoticeBoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		NoticeBoardDetailService noticeBoardDetailService = new NoticeBoardDetailService();
		NoticeDTO article = noticeBoardDetailService.getArticle(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/adminnoticeSelect.jsp");
   		return forward;
	}

}
