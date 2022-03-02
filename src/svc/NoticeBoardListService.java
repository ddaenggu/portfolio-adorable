package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import vo.NoticeDTO;

public class NoticeBoardListService {
	
	public int getListCount() throws Exception{ // 페이징처리를 위해 글 개수를 세는 메소드
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectNoticeListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<NoticeDTO> getArticleList(int page, int limit) throws Exception{ // 게시글 전체를 뽑아오는 메소드
		
		ArrayList<NoticeDTO> articleList = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectNoticeArticleList(page,limit);
		close(con);
		return articleList;
		
	}

}
