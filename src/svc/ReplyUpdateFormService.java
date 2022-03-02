package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

public class ReplyUpdateFormService {

	public BoardBean getArticle(int reply_num) throws Exception {

		BoardBean article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		article = boardDAO.selectReplyArticle(reply_num);
		close(con);
		return article;

	}

}
