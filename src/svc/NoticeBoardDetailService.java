package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import vo.NoticeDTO;

public class NoticeBoardDetailService {
	
	public NoticeDTO getArticle(int board_num) throws Exception { // 글 선택해서 보는 메소드

		NoticeDTO article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateNoticeCount(board_num);

		if (updateCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		article = boardDAO.selectNoticeArticle(board_num);
		close(con);
		return article;

	}

}
