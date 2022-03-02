package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReplyUpdateFormService;
import vo.ActionForward;
import vo.BoardBean;

public class Re_ReplyWriteFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int reply_num=Integer.parseInt(request.getParameter("reply_num"));
		String page = request.getParameter("page");
		ReplyUpdateFormService replyUpdateFormService = new ReplyUpdateFormService();
		BoardBean article = replyUpdateFormService.getArticle(reply_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
		request.setAttribute("article", article);
   		forward.setPath("/withmypetReplyinsert.jsp");
   		
   		return forward;
   		
	}

}
