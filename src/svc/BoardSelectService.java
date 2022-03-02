package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

public class BoardSelectService {

	public BoardBean getArticle(int board_num) throws Exception{
		
		BoardBean article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;
		
	}
}
