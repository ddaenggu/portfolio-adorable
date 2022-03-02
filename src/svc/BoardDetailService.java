package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.BoardBean;

public class BoardDetailService {

	public BoardBean getArticle(int board_num) throws Exception { // 글 선택해서 보는 메소드

		BoardBean article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateCount(board_num);

		if (updateCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;

	}
	
	public ArrayList<BoardBean> getReplyArticleList(int board_num) throws Exception { // 글 속에 댓글 전체 불러오는 메소드
		
		ArrayList<BoardBean> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectReplyList(board_num);
		close(con);
		return articleList;
	}
 
}
