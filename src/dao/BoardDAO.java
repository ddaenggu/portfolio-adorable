package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.BoardBean;
import vo.NoticeDTO;

public class BoardDAO {

	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		if (boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int selectListCount() { // 페이징처리를 위해 글 개수 세는 메소드

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from placerecommendBoard");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	public ArrayList<BoardBean> selectArticleList(int page, int limit) { // 글 전체목록 불러오기 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = "select board_num,board_title,concat(left(name,2),'*') as name,board_date,board_look"
				+ " from placerecommendBoard,customer where placerecommendBoard.id=customer.id"
				+ " order by board_num desc limit ?,20";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow = (page - 1) * 20;

		try {
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				board = new BoardBean();
				board.setBoard_num(rs.getInt("board_num"));
				board.setName(rs.getString("name"));
				board.setBoard_title(rs.getString("board_title"));
				board.setBoard_date(rs.getString("board_date"));
				board.setBoard_look(rs.getInt("board_look"));

				articleList.add(board);
			}

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	public ArrayList<BoardBean> selectMycontentList(String id, int page, int limit) { // 내글보기 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = "select board_num,board_title,concat(left(name,2),'*') as name,board_date,board_look"
				+ " from placerecommendBoard,customer where placerecommendBoard.id=customer.id"
				+ " and placerecommendBoard.id = ? order by board_num desc limit ?,20";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow = (page - 1) * 10;

		try {
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				board = new BoardBean();
				board.setBoard_num(rs.getInt("board_num"));
				board.setName(rs.getString("name"));
				board.setBoard_title(rs.getString("board_title"));
				board.setBoard_date(rs.getString("board_date"));
				board.setBoard_look(rs.getInt("board_look"));

				articleList.add(board);
			}

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;
	}

	public ArrayList<BoardBean> selectSearchList(String search, int page, int limit) { // 검색기능 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = "select board_num,board_title,concat(left(name,2),'*') as name,board_date,board_look"
				+ " from placerecommendBoard,customer where placerecommendBoard.id=customer.id"
				+ " and board_title like ? order by board_num desc limit ?,20";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;
		int startrow = (page - 1) * 10;

		try {
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				board = new BoardBean();
				board.setBoard_num(rs.getInt("board_num"));
				board.setName(rs.getString("name"));
				board.setBoard_title(rs.getString("board_title"));
				board.setBoard_date(rs.getString("board_date"));
				board.setBoard_look(rs.getInt("board_look"));

				articleList.add(board);
			}

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;
	}

	public int insertArticle(BoardBean article) { // 글 입력하는 메소드
		PreparedStatement pstmt = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			sql = "insert into placerecommendBoard (board_num,id,board_title,board_content,board_date,board_look,"
					+ "board_img) values (default,?,?,?,now(),0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getId());
			pstmt.setString(2, article.getBoard_title());
			pstmt.setString(3, article.getBoard_content());
			pstmt.setString(4, article.getBoard_img());
			
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return insertCount;

	}

	public int updateCount(int board_num) { // 글 읽으면 조회수 증가하는 메소드

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "update placerecommendBoard set board_look = board_look+1 where board_num = " + board_num;

		try {
			pstmt = con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException ex) {
		} finally {
			close(pstmt);
		}
		return updateCount;

	}

	public BoardBean selectArticle(int board_num) { // 글 select해서 자세히 보는 메소드

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;

		try {
			pstmt = con.prepareStatement(
					"select board_num,placerecommendBoard.id,board_title,board_content,concat(left(name,2),'*') as name,board_date,"
							+ "board_look,board_img from placerecommendBoard,customer where "
							+ "placerecommendBoard.id = customer.id and board_num = ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardBean = new BoardBean();
				boardBean.setBoard_num(rs.getInt("board_num"));
				boardBean.setId(rs.getString("id"));
				boardBean.setBoard_title(rs.getString("board_title"));
				boardBean.setName(rs.getString("name"));
				boardBean.setBoard_look(rs.getInt("board_look"));
				boardBean.setBoard_date(rs.getString("board_date"));
				boardBean.setBoard_content(rs.getString("board_content"));
				boardBean.setBoard_img(rs.getString("board_img"));
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}

	public int deleteArticle(int board_num) { // 글 delete하는 메소드

		PreparedStatement pstmt = null;
		String board_delete_sql = "delete from placerecommendBoard where board_num=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return deleteCount;

	}
	
	public int deleteAllReplyArticle(int board_num) { // 글 delete할때 댓글도 같이 delete하는 메소드

		PreparedStatement pstmt = null;
		String board_delete_sql = "delete from placerecommendReply where board_num=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return deleteCount;

	}

	public int updateArticle(BoardBean article) { // 글 update하는 메소드

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update placerecommendBoard set board_title=?,board_content=?,board_img=? where board_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBoard_title());
			pstmt.setString(2, article.getBoard_content());
			pstmt.setString(3, article.getBoard_img());
			pstmt.setInt(4, article.getBoard_num());
			updateCount = pstmt.executeUpdate();
		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return updateCount;

	}

	public ArrayList<BoardBean> selectReplyList(int board_num) { // 댓글 출력 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = "select reply_num,placerecommendReply.id,concat(left(name,2),'*') as name,reply_content,reply_ref,"
				+ "reply_lev,reply_seq,reply_date from placerecommendReply,customer "
				+ "where placerecommendReply.id=customer.id and board_num=? order by reply_ref asc, reply_seq asc";
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		BoardBean board = null;

		try {
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				board = new BoardBean();
				board.setReply_num(rs.getInt("reply_num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setReply_content(rs.getString("reply_content"));
				board.setReply_ref(rs.getInt("reply_ref"));
				board.setReply_lev(rs.getInt("reply_lev"));
				board.setReply_seq(rs.getInt("reply_seq"));
				board.setReply_date(rs.getString("reply_date"));

				articleList.add(board);
			}

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;
	}

	public int insertReplyArticle(BoardBean article) { // 댓글 insert하는 메소드

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement("select max(reply_num) from placerecommendReply");
			// reply_ref을 reply_num과 똑같이 맞추기 위해서 reply_num 최대숫자 뽑아내서 +1 해서 넣음
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into placerecommendReply (reply_num,id,board_num,reply_content,reply_ref,reply_lev,"
					+ "reply_seq,reply_date) values (?,?,?,?,?,0,0,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getId());
			pstmt.setInt(3, article.getBoard_num());
			pstmt.setString(4, article.getReply_content());
			pstmt.setInt(5, num);

			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}

	public int deleteReplyArticle(int reply_num) { // 댓글 delete하는 메소드

		PreparedStatement pstmt = null;
		String board_delete_sql = "delete from placerecommendReply where reply_num=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, reply_num);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return deleteCount;

	}

	public BoardBean selectReplyArticle(int reply_num) { // 댓글 수정하기 위해서 select해서 자세히 보는 메소드

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;
		try {
			pstmt = con.prepareStatement("select * from placerecommendReply where reply_num=?");
			pstmt.setInt(1, reply_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardBean = new BoardBean();
				boardBean.setReply_num(rs.getInt("reply_num"));
				boardBean.setBoard_num(rs.getInt("board_num"));
				boardBean.setReply_content(rs.getString("reply_content"));
				boardBean.setReply_ref(rs.getInt("reply_ref"));
				boardBean.setReply_lev(rs.getInt("reply_lev"));
				boardBean.setReply_seq(rs.getInt("reply_seq"));
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return boardBean;

	}

	public int updateReplyArticle(BoardBean article) { // 댓글 update하는 메소드

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update placerecommendReply set reply_content=? where reply_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getReply_content());
			pstmt.setInt(2, article.getReply_num());
			updateCount = pstmt.executeUpdate();
		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return updateCount;

	}

	public int selectMaxReply_seq(int reply_ref) { // 댓글에 댓글 달기위해서 최대 reply_seq구하는 메소드

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(
					"select max(reply_seq) from placerecommendReply where reply_ref=?");
			pstmt.setInt(1, reply_ref);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount; // 최댓값의 +1로 리턴
	}

	public int insertRE_ReplyArticle(BoardBean article,int reply_seq) { // 댓글에 댓글다는 메소드

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_max_sql = "select max(reply_num) from placerecommendReply";
		String sql = "";
		int num = 0;
		int insertCount = 0;
		int re_lev = article.getReply_lev();
		int re_seq = article.getReply_seq();

		try {
			pstmt = con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			if (re_lev != 0) {
				sql = "update placerecommendReply set reply_seq=reply_seq+1 where reply_ref=? ";
				sql += "and reply_seq>?"; // 답글 하나 더 달릴 때 마다 기존 답글 순서 밑으로 밀려남
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, article.getReply_ref());
				pstmt.setInt(2, article.getReply_seq());
				int updateCount = pstmt.executeUpdate();

				if (updateCount > 0) {
					commit(con);
				}
			

			re_lev = re_lev + 1;
			re_seq = re_seq + 1; // 받아온 reply_seq 최댓값에서 +1
			sql = "insert into placerecommendReply (reply_num,id,board_num,reply_content,reply_ref,reply_lev,";
			sql += "reply_seq,reply_date) values(?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getId());
			pstmt.setInt(3, article.getBoard_num());
			pstmt.setString(4, article.getReply_content());
			pstmt.setInt(5, article.getReply_ref());
			pstmt.setInt(6, re_lev);
			pstmt.setInt(7, re_seq);
			insertCount = pstmt.executeUpdate();
			}
			
			else {
				re_lev = re_lev + 1;
				sql = "insert into placerecommendReply (reply_num,id,board_num,reply_content,reply_ref,reply_lev,";
				sql += "reply_seq,reply_date) values(?,?,?,?,?,?,?,now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, article.getId());
				pstmt.setInt(3, article.getBoard_num());
				pstmt.setString(4, article.getReply_content());
				pstmt.setInt(5, article.getReply_ref());
				pstmt.setInt(6, re_lev);
				pstmt.setInt(7, reply_seq+1);
				insertCount = pstmt.executeUpdate();
			}
			
			
		} catch (SQLException ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	
	// 공지사항
	
	public int selectNoticeListCount() { // 페이징처리를 위해 글 개수 세는 메소드

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from noticeBoard");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}
	
	public ArrayList<NoticeDTO> selectNoticeArticleList(int page, int limit) { // 글 전체목록 불러오기 메소드
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql = "select * from noticeBoard,admin where noticeBoard.admin_id = admin.admin_id order by board_num desc limit ?,20";
		ArrayList<NoticeDTO> articleList = new ArrayList<NoticeDTO>();
		NoticeDTO notice = null;
		int startrow = (page - 1) * 20;

		try {
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				notice = new NoticeDTO();
				notice.setBoard_num(rs.getInt("board_num"));
				notice.setAdmin_name(rs.getString("admin_name"));
				notice.setBoard_title(rs.getString("board_title"));
				notice.setBoard_date(rs.getString("board_date"));
				notice.setBoard_look(rs.getInt("board_look"));

				articleList.add(notice);
			}

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}
	
	public int insertNoticeArticle(NoticeDTO article) { // 글 입력하는 메소드
		PreparedStatement pstmt = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			sql = "insert into noticeBoard (board_num,admin_id,board_title,board_content,board_date,board_look) values (default,?,?,?,now(),0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getAdmin_id());
			pstmt.setString(2, article.getBoard_title());
			pstmt.setString(3, article.getBoard_content());
			
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return insertCount;

	}
	
	public int updateNoticeCount(int board_num) { // 글 읽으면 조회수 증가하는 메소드

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "update noticeBoard set board_look = board_look+1 where board_num = " + board_num;

		try {
			pstmt = con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException ex) {
		} finally {
			close(pstmt);
		}
		return updateCount;

	}

	public NoticeDTO selectNoticeArticle(int board_num) { // 글 select해서 자세히 보는 메소드

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeDTO noticeDTO = null;

		try {
			pstmt = con.prepareStatement(
					"select board_num,admin_name,board_title,board_content,board_look,board_date from noticeBoard,admin where "
							+ "noticeBoard.admin_id = admin.admin_id and board_num = ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				noticeDTO = new NoticeDTO();
				noticeDTO.setBoard_num(rs.getInt("board_num"));
				noticeDTO.setAdmin_name(rs.getString("admin_name"));
				noticeDTO.setBoard_title(rs.getString("board_title"));
				noticeDTO.setBoard_content(rs.getString("board_content"));
				noticeDTO.setBoard_look(rs.getInt("board_look"));
				noticeDTO.setBoard_date(rs.getString("board_date"));
				
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return noticeDTO;

	}
	
	public int deleteNoticeArticle(int board_num) { // 글 delete하는 메소드

		PreparedStatement pstmt = null;
		String board_delete_sql = "delete from noticeBoard where board_num=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return deleteCount;

	}
	
	public int updateNoticeArticle(NoticeDTO article) { // 글 update하는 메소드

		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update noticeBoard set board_title=?,board_content=? where board_num=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBoard_title());
			pstmt.setString(2, article.getBoard_content());
			pstmt.setInt(3, article.getBoard_num());
			updateCount = pstmt.executeUpdate();
		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return updateCount;

	}
	
	

}
