package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReplyDeleteProService;
import vo.ActionForward;

public class ReplyDeleteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		ReplyDeleteProService replyDeleteProService = new ReplyDeleteProService();

		boolean isDeleteSuccess = replyDeleteProService.removeArticle(reply_num);
		request.setAttribute("page", page);

		if (!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��������');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardDetailSelect.board?board_num=" + board_num +"&page="+page);
		}

		return forward;
	}

}
