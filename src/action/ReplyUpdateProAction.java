package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReplyUpdateProService;
import vo.ActionForward;
import vo.BoardBean;

public class ReplyUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		int reply_num = 0;
		ActionForward forward = null;
		boolean isModifySuccess = false;
		reply_num = Integer.parseInt(request.getParameter("reply_num"));
		if (reply_num == 0)
			reply_num = 1;
		String page = request.getParameter("page");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardBean article = new BoardBean();
		ReplyUpdateProService replyUpdateProService = new ReplyUpdateProService();

		article.setReply_num(reply_num);
		article.setReply_content(request.getParameter("reply_content"));
		isModifySuccess = replyUpdateProService.modifyArticle(article);
		request.setAttribute("page", page);
		if (!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��������');");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardDetailSelect.board?board_num=" + board_num +"&page="+page);
		}

		return forward;
	}

}
