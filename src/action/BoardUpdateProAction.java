package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardUpdateProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		boolean isModifySuccess = false;
		String realFolder="";
		String saveFolder="/imgfile";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		String page = request.getParameter("page");
		BoardBean article = new BoardBean();
		int board_num = Integer.parseInt(multi.getParameter("board_num"));
		String board_title = multi.getParameter("board_title");
		String board_content = multi.getParameter("board_content");
		article.setBoard_img(
				multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		
		
		if (board_num == 0)
			board_num = 1;
		BoardUpdateProService boardModifyProService = new BoardUpdateProService();
		
		article.setBoard_num(board_num);
		article.setBoard_title(board_title);
		article.setBoard_content(board_content);
		isModifySuccess = boardModifyProService.modifyArticle(article);
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
			forward.setPath("boardDetailSelect.board?board_num=" + article.getBoard_num() +"&page="+page);
		}

		return forward;
	}

}
