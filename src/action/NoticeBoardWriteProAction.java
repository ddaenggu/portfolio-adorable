package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.NoticeBoardWriteProService;
import vo.ActionForward;
import vo.NoticeDTO;

public class NoticeBoardWriteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		
		ActionForward forward=null;
		
		HttpSession session = request.getSession(); // session 받아오는 법
		String id = (String)session.getAttribute("admin_id");
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setAdmin_id(id);
		noticeDTO.setBoard_title(request.getParameter("board_title"));
		noticeDTO.setBoard_content(request.getParameter("board_content"));
		
		NoticeBoardWriteProService noticeBoardWriteProService = new NoticeBoardWriteProService();
		boolean isWriteSuccess = noticeBoardWriteProService.writeArticle(noticeDTO);
		
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
			forward.setPath("adminNoticeBoardList.board");
		}

		return forward;
	}

}
