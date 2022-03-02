package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardWriteProService;
import svc.ReplyWriteProService;
import vo.ActionForward;
import vo.BoardBean;

public class ReplyWriteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward=null;
		BoardBean boardBean = null;
		String page = request.getParameter("page");
		HttpSession session = request.getSession(); // session 받아오는 법
		String id = (String)session.getAttribute("id");
		boardBean = new BoardBean();
		boardBean.setId(id);
		boardBean.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		boardBean.setReply_content(request.getParameter("reply_content"));
		ReplyWriteProService replyWriteProService = new ReplyWriteProService();
		boolean isWriteSuccess = replyWriteProService.writeArticle(boardBean);
		request.setAttribute("page", page);
		System.out.println(isWriteSuccess);
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardDetailSelect.board?board_num=" + boardBean.getBoard_num() +"&page="+page);
		}

		return forward;
	}

}
