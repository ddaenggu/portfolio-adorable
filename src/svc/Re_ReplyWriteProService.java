package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

public class Re_ReplyWriteProService {
	
	public int getListCount(int reply_ref) throws Exception{ // max(reply_seq) 구하는 메소드
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectMaxReply_seq(reply_ref);
		close(con);
		return listCount;
		
	}
	
	public boolean writeArticle(BoardBean boardBean,int reply_seq) throws Exception {

		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.insertRE_ReplyArticle(boardBean,reply_seq);

		if (insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return isWriteSuccess;
	}

}
