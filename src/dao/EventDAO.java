package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import vo.EventDTO;

public class EventDAO {
	
	DataSource ds;
	Connection con;
	private static EventDAO EventDAO;

	private EventDAO() {
	}

	public static EventDAO getInstance() {
		if (EventDAO == null) {
			EventDAO = new EventDAO();
		}
		return EventDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public boolean selectEvent(EventDTO eventdto) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;

		try {
			pstmt = con.prepareStatement("select * from attendEvent where id = ? and DATE_FORMAT(event_date, \"%Y-%m-%d\") = CURDATE()");
			pstmt.setString(1, eventdto.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = true;
			}
		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
	}
	
	public EventDTO selectCoupon() {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EventDTO eventdto = null;
		
		try {
			pstmt = con.prepareStatement("select * from coupon order by rand() limit 1");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				eventdto = new EventDTO();
				eventdto.setCoupon_num(rs.getInt("coupon_num"));
				eventdto.setCoupon_sum(rs.getInt("coupon_sum"));
			}
		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}

		return eventdto;
	}
	
	public int insertEvent(EventDTO eventdto) {
		
		PreparedStatement pstmt = null;
		String sql = "";
		int insertCount = 0;

		try {
			sql = "insert into attendEvent values (default, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, eventdto.getId());
			pstmt.setInt(2, eventdto.getCoupon_num());
			
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return insertCount;
	}
	
	public int updatePoint(EventDTO eventdto) {
		
		PreparedStatement pstmt = null;
		String sql = "";
		int updateCount = 0;

		try {
			sql = "update customer set point = point + ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eventdto.getPoint());
			pstmt.setString(2, eventdto.getId());
			
			updateCount = pstmt.executeUpdate();

		} catch (Exception ex) {
		} finally {
			close(pstmt);
		}

		return updateCount;
	}
	

}
