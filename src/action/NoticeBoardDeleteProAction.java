package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDeleteProService;
import svc.NoticeBoardDeleteProService;
import vo.ActionForward;

public class NoticeBoardDeleteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String nowPage = request.getParameter("page");
		
		NoticeBoardDeleteProService noticeBoardDeleteProService = new NoticeBoardDeleteProService();

		boolean isDeleteSuccess = noticeBoardDeleteProService.removeArticle(board_num);

		request.setAttribute("page", nowPage);
		
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
			forward.setPath("adminNoticeBoardList.board?page=" + nowPage);
		}

		return forward;
	}

}
