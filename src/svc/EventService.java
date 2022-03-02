package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.EventDAO;
import vo.EventDTO;

public class EventService {
	
	public boolean selectEvent(EventDTO eventdto) throws Exception {
		
		boolean result = false;
		Connection con = getConnection();
		EventDAO eventDAO = EventDAO.getInstance();
		eventDAO.setConnection(con);
		result = eventDAO.selectEvent(eventdto);

		close(con);
		return result;
	}
	
	public EventDTO selectCoupon() {
		
		EventDTO article = null;
		Connection con = getConnection();
		EventDAO eventDAO = EventDAO.getInstance();
		eventDAO.setConnection(con);
		
		article = eventDAO.selectCoupon();
		close(con);
		return article;
		
	}
	
	public boolean insertEvent(EventDTO eventdto) {
		
		boolean result = false;
		Connection con = getConnection();
		EventDAO eventDAO = EventDAO.getInstance();
		eventDAO.setConnection(con);
		int insertCount = eventDAO.insertEvent(eventdto);
		
		if(insertCount > 0){
			commit(con);
			result = true;
		}
		else{
			rollback(con);
		}
		return result;
	}
	
	public boolean updatePoint(EventDTO eventdto) {
		
		boolean result = false;
		Connection con = getConnection();
		EventDAO eventDAO = EventDAO.getInstance();
		eventDAO.setConnection(con);
		int updateCount = eventDAO.updatePoint(eventdto);
		
		if(updateCount > 0){
			commit(con);
			result = true;
		}
		else{
			rollback(con);
		}
		return result;
		
	}

}
