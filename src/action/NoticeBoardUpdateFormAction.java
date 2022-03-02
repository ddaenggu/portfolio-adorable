package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.NoticeBoardUpdateFormService;
import vo.ActionForward;
import vo.NoticeDTO;

public class NoticeBoardUpdateFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		NoticeBoardUpdateFormService noticeBoardUpdateFormService = new NoticeBoardUpdateFormService();
		NoticeDTO article = noticeBoardUpdateFormService.getArticle(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
		request.setAttribute("article", article);
   		forward.setPath("/noticeupdate.jsp");
   		
   		return forward;
	}

}
