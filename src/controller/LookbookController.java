package controller;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.ModelLookbook;

public class LookbookController {

	Connection conn = null;
	Statement stmt = null;

	public void dbconnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/adorable?characterEncoding=utf-8", "root",
					"0609");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void dbclose() {
		try {
			conn.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<ModelLookbook> selectProduct(String id) { // customer id로 주문한 제품 가져오는 메소드

		dbconnect();
		ArrayList<ModelLookbook> arr = new ArrayList<ModelLookbook>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select distinct product.pro_code,pro_name from productOrder,product "
					+ "where productOrder.pro_code=product.pro_code and id = '" + id + "'");
			while (rs.next()) {
				ModelLookbook ml = new ModelLookbook();
				ml.setPro_code(rs.getInt("pro_code"));
				ml.setPro_name(rs.getString("pro_name"));

				arr.add(ml);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		dbclose();
		return arr;
	}

	public ArrayList<ModelLookbook> selectList() { // lookbook 전체 리스트 출력 메소드

		dbconnect();
		ArrayList<ModelLookbook> arr = new ArrayList<ModelLookbook>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select lb_num,lb_img,concat(left(name,2),'*') as name,lb_like from lookbook,customer "
							+ "where lookbook.id=customer.id order by lb_num desc");
			while (rs.next()) {
				ModelLookbook ml = new ModelLookbook();
				ml.setLb_num(rs.getInt("lb_num"));
				ml.setLb_img(rs.getString("lb_img"));
				ml.setName(rs.getString("name"));
				ml.setLb_like(rs.getInt("lb_like"));

				arr.add(ml);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		dbclose();
		return arr;
	}

	public boolean insertLookbook(ModelLookbook ml) { // lookbook 글쓰기

		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format(
					"insert into lookbook (lb_num, id, proname, lb_img, lb_title, lb_content, lb_like, lb_date) values "
							+ "(default,'%s','%s','%s','%s','%s',0,now());",
					ml.getId(), ml.getProname(), ml.getLb_img(), ml.getLb_title(), ml.getLb_content());
			int st = stmt.executeUpdate(sql);
			if (st > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}

	public boolean updatePoint(ModelLookbook ml) { // lookbook 글쓰면 포인트 update

		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("update customer set point = point + 500 where id = '" + ml.getId() + "'");
			int st = stmt.executeUpdate(sql);
			if (st > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}

	public ModelLookbook selectDetail(int lb_num) { // lookbook 글 select해서 보는 메소드

		dbconnect();
		ModelLookbook m = new ModelLookbook();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select lb_num,proname,lookbook.id,lb_title,lb_content,lb_img,lb_like,lb_date,concat(left(name,2),'*') as name "
							+ "from lookbook,customer where lookbook.id=customer.id and lb_num = " + lb_num);
			if (rs.next()) {
				m.setLb_num(rs.getInt("lb_num"));
				m.setLb_title(rs.getString("lb_title"));
				m.setLb_content(rs.getString("lb_content"));
				m.setLb_img(rs.getString("lb_img"));
				m.setLb_like(rs.getInt("lb_like"));
				m.setLb_date(rs.getString("lb_date"));
				m.setName(rs.getString("name"));
				m.setProname(rs.getString("proname"));
				m.setId(rs.getString("id"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return m;
	}

	public boolean updateLookbook(ModelLookbook ml) { // lookbook 수정

		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("update lookbook set lb_title = '" + ml.getLb_title() + "', lb_content = '"
					+ ml.getLb_content() + "'" + " where lb_num =" + ml.getLb_num());
			int st = stmt.executeUpdate(sql);
			if (st > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}

	public boolean selectLike(ModelLookbook ml) { // 글에 좋아요를 눌렀는지 확인하는 메소드

		dbconnect();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select * from lookbookLike where id = '" + ml.getId() + "' and lb_num = " + ml.getLb_num());
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}

	public ArrayList<ModelLookbook> selectBest() { // lookbook 베스트 3개 출력 메소드

		dbconnect();
		ArrayList<ModelLookbook> arr = new ArrayList<ModelLookbook>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select lb_num,lb_img,concat(left(name,2),'*') as name,lb_like from lookbook,customer "
							+ "where lookbook.id=customer.id order by lb_like desc limit 3");
			while (rs.next()) {
				ModelLookbook ml = new ModelLookbook();
				ml.setLb_num(rs.getInt("lb_num"));
				ml.setLb_img(rs.getString("lb_img"));
				ml.setName(rs.getString("name"));
				ml.setLb_like(rs.getInt("lb_like"));

				arr.add(ml);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public ArrayList<ModelLookbook> selectReply(int lb_num) { // lookbook 댓글 출력 메소드

		dbconnect();
		ArrayList<ModelLookbook> arr = new ArrayList<ModelLookbook>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select reply_num,lb_num,lookbookReply.id,concat(left(name,2),'*') as name"
					+ ",reply_content,reply_date,reply_ref,reply_lev,reply_seq from "
					+ "lookbookReply,customer where lookbookReply.id=customer.id and"
					+ " lb_num = "+lb_num+" order by reply_ref asc, reply_seq asc");
			while (rs.next()) {
				ModelLookbook ml = new ModelLookbook();
				ml.setReply_num(rs.getInt("reply_num"));
				ml.setLb_num(rs.getInt("lb_num"));
				ml.setId(rs.getString("id"));
				ml.setName(rs.getString("name"));
				ml.setReply_content(rs.getString("reply_content"));
				ml.setReply_date(rs.getString("reply_date"));
				ml.setReply_ref(rs.getInt("reply_ref"));
				ml.setReply_lev(rs.getInt("reply_lev"));
				ml.setReply_seq(rs.getInt("reply_seq"));
				
				arr.add(ml);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}

	public boolean insertReply(ModelLookbook ml) { // 댓글 insert하는 메소드

		dbconnect();

		int num = 0;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select max(reply_num) from lookbookReply");

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			String sql = String.format(
					"insert into lookbookReply values (%d,'%s',%d,'%s',now(),%d,0,0)",num,ml.getId(),ml.getLb_num(),ml.getReply_content(),num);
			int st = stmt.executeUpdate(sql);
			if (st > 0) {
				return true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public boolean updateReply(ModelLookbook ml) { // 댓글 update 메소드
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("update lookbookReply set reply_content = '" + ml.getReply_content() +"' where reply_num = " + ml.getReply_num());
			int st = stmt.executeUpdate(sql);
			if (st > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public boolean deleteReply(ModelLookbook ml) { // 댓글 delete 메소드
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("delete from lookbookReply where reply_num = "+ml.getReply_num());
			int st = stmt.executeUpdate(sql);
			if (st > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public int selectMaxReply_seq(int reply_ref) { // 댓글을 달기위해 최대 reply_seq 구하는 메소드
		
		dbconnect();
		int max = 0;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select max(reply_seq) from lookbookReply where reply_ref = "+reply_ref);
			if (rs.next()) {
				max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return max;
	}
	
	public boolean insertRe_Reply(ModelLookbook ml, int reply_seq) { // 댓글에 답글다는 메소드
		
		dbconnect();
		int num = 0;
		int re_lev = ml.getReply_lev()+1;
		
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select max(reply_num) from lookbookReply");

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			String sql = String.format(
					"insert into lookbookReply values (%d,'%s',%d,'%s',now(),%d,%d,%d)",num,ml.getId(),ml.getLb_num(),ml.getReply_content(),ml.getReply_ref(),re_lev,reply_seq+1);
			int st = stmt.executeUpdate(sql);
			if (st > 0) {
				return true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		
		dbclose();
		return false;
	}

}
