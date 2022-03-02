package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.Re_ReplyWriteProService;
import svc.ReplyWriteProService;
import vo.ActionForward;
import vo.BoardBean;

public class Re_ReplyWriteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward=null;
		BoardBean boardBean = null;
		String page = request.getParameter("page");
		HttpSession session = request.getSession(); // session 받아오는 법
		String id = (String)session.getAttribute("id");
		int reply_ref = Integer.parseInt(request.getParameter("reply_ref")); // max(reply_seq)를 알아내기위한 reply_ref
		int reply_lev = Integer.parseInt(request.getParameter("reply_lev")); // max(reply_seq)를 알아내기위한 reply_lev
		boardBean = new BoardBean();
		boardBean.setId(id);
		boardBean.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		boardBean.setReply_content(request.getParameter("reply_content"));
		boardBean.setReply_ref(reply_ref);
		boardBean.setReply_lev(reply_lev);
		boardBean.setReply_seq(Integer.parseInt(request.getParameter("reply_seq")));
		Re_ReplyWriteProService re_ReplyWriteProService = new Re_ReplyWriteProService();
		int listCount = re_ReplyWriteProService.getListCount(reply_ref);
		boolean isWriteSuccess = re_ReplyWriteProService.writeArticle(boardBean,listCount);
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
