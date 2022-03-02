package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.ModelLookbook;
import model.ModelMypet;

public class MypetController {
	
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
	
	public boolean insertMypet(ModelMypet mm) { // mypet 글 insert
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("insert into mypet values (default,'"+mm.getId()+"','"+mm.getMypet_content()+"','"+mm.getMypet_img()+"',now())");
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
	
	public ArrayList<ModelMypet> selectList(ModelMypet mm) { // mypet list select
		
		dbconnect();
		
		ArrayList<ModelMypet> arr = new ArrayList<ModelMypet>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from mypet where id  = '"+mm.getId()+"' order by mypet_num desc");
			while (rs.next()) {
				ModelMypet m = new ModelMypet();
				m.mypet_num = rs.getInt("mypet_num");
				m.id = rs.getString("id");
				m.mypet_content = rs.getString("mypet_content");
				m.mypet_img = rs.getString("mypet_img");
				m.mypet_date = rs.getString("mypet_date");
				
				arr.add(m);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public ModelMypet selectContent(ModelMypet mm) { // mypet 글 하나만 select
		
		dbconnect();
		ModelMypet m = new ModelMypet();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from mypet where mypet_num = "+mm.getMypet_num());
			if (rs.next()) {
				m.mypet_num = rs.getInt("mypet_num");
				m.id = rs.getString("id");
				m.mypet_content = rs.getString("mypet_content");
				m.mypet_img = rs.getString("mypet_img");
				m.mypet_date = rs.getString("mypet_date");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return m;
	}
	
	public boolean updateMypet(ModelMypet mm) { // mypet update
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("update mypet set mypet_content = '"+mm.getMypet_content()+"' where mypet_num ="+mm.getMypet_num());
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
	
	public boolean deleteMypetReply(ModelMypet mm) { // mypet delete할때 있던 댓글 delete
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("delete from mypetReply where mypet_num ="+mm.getMypet_num());
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

	public boolean deleteMypet(ModelMypet mm) { // mypet delete
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("delete from mypet where mypet_num ="+mm.getMypet_num());
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
	
	public ArrayList<ModelMypet> selectId(String search) { // 친구추가 위해서 아이디 검색
		
		dbconnect();
		ArrayList<ModelMypet> arr = new ArrayList<ModelMypet>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from customer where id like '%"+search+"%'");
			while (rs.next()) {
				ModelMypet m = new ModelMypet();
				m.id = rs.getString("id");
				m.name = rs.getString("name");
				
				arr.add(m);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}	
		dbclose();
		return arr;
	}
	
	public boolean selectAddFriend(String id, String friendid) { // 친구추가 버튼 표시 (친구요청중)
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from requestFriend where request_id = '"+id+"' and get_id = '"+friendid+"'");
			if (rs.next()) {
				return true;
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public boolean selectGetFriend(String id, String friendid) { // 친구추가 버튼 표시 (친구수락)
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from requestFriend where get_id = '"+id+"' and request_id = '"+friendid+"'");
			if (rs.next()) {
				return true;
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public boolean selectCompleteFriend(String id, String friendid) { // 친구추가 버튼 표시 (친구)
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from mypetFriend where id = '"+id+"' and friendid = '"+friendid+"'");
			if (rs.next()) {
				return true;
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public boolean insertRequestFriend(ModelMypet mm) { // 친구요청하기
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("insert into requestFriend values (default,'%s','%s')",mm.getRequest_id(),mm.getGet_id());
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
	
	public boolean deleteRequestFriend(ModelMypet mm) { // 친구요청 취소하기
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("delete from requestFriend where request_id = '"+mm.getRequest_id()+"' and get_id = '"+mm.getGet_id()+"'");
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
	
	public boolean insertGetFriend(ModelMypet mm) { // 친구수락하기
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("insert into mypetFriend values (default,'%s','%s')",mm.getRequest_id(),mm.getGet_id());
			String sql2 = String.format("insert into mypetFriend values (default,'%s','%s')",mm.getGet_id(),mm.getRequest_id());
			String sql3 = String.format("delete from requestFriend where request_id = '"+mm.getRequest_id()+"' and get_id = '"+mm.getGet_id()+"'");
			int st = stmt.executeUpdate(sql);
			int st2 = stmt.executeUpdate(sql2);
			int st3 = stmt.executeUpdate(sql3);
			if (st > 0 && st2 > 0 && st3 > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public boolean deleteFriend(ModelMypet mm) { // 친구삭제하기
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("delete from mypetFriend where id = '"+mm.getId()+"' and friendid = '"+mm.getFriendid()+"'");
			String sql2 = String.format("delete from mypetFriend where id = '"+mm.getFriendid()+"' and friendid = '"+mm.getId()+"'");
			int st = stmt.executeUpdate(sql);
			int st2 = stmt.executeUpdate(sql2);
			if (st > 0 && st2 > 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public ArrayList<ModelMypet> selectFriend(String id) { // 내 친구 전체 select
		
		dbconnect();
		ArrayList<ModelMypet> arr = new ArrayList<ModelMypet>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from mypetFriend,customer where mypetFriend.friendid=customer.id and"
					+ " mypetFriend.id = '"+id+"'");
			while (rs.next()) {
				ModelMypet m = new ModelMypet();
				m.friendid = rs.getString("friendid");
				m.name = rs.getString("name");
				
				arr.add(m);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public ArrayList<ModelMypet> selectFriendMypet(ModelMypet mm) { // 내 친구 mypet 전체 select
		
		dbconnect();
		ArrayList<ModelMypet> arr = new ArrayList<ModelMypet>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from mypet where id = '"+mm.getFriendid()+"' order by mypet_num desc");
			while (rs.next()) {
				ModelMypet m = new ModelMypet();
				m.mypet_num = rs.getInt("mypet_num");
				m.id = rs.getString("id");
				m.mypet_content = rs.getString("mypet_content");
				m.mypet_img = rs.getString("mypet_img");
				m.mypet_date = rs.getString("mypet_date");
				
				arr.add(m);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public ModelMypet selectInfo(ModelMypet mm) { // 내 친구 mypet 볼 때 띄울 친구 정보
		
		dbconnect();
		ModelMypet m = new ModelMypet();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from customer where id = '"+mm.getFriendid()+"'");
			if (rs.next()) {
				m.id = rs.getString("id");
				m.name = rs.getString("name");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return m;
	}
	
	public boolean insertReply(ModelMypet mm) { // 댓글 insert하는 메소드

		dbconnect();

		int num = 0;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select max(reply_num) from mypetReply");

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			String sql = String.format(
					"insert into mypetReply values (%d,'%s',%d,'%s',now(),%d,0,0)",num,mm.getId(),mm.getMypet_num(),mm.getReply_content(),num);
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
	
	public ArrayList<ModelMypet> selectReply(int mypet_num) { // mypet 댓글 출력
		
		dbconnect();
		ArrayList<ModelMypet> arr = new ArrayList<ModelMypet>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select reply_num,mypet_num,mypetReply.id,name,reply_content,reply_date,reply_ref,reply_lev,reply_seq from "
					+ "mypetReply,customer where mypetReply.id=customer.id and mypet_num = "+mypet_num+" order by reply_ref asc, reply_seq asc");
			while (rs.next()) {
				ModelMypet mm = new ModelMypet();
				mm.setReply_num(rs.getInt("reply_num"));
				mm.setMypet_num(rs.getInt("mypet_num"));
				mm.setId(rs.getString("id"));
				mm.setName(rs.getString("name"));
				mm.setReply_content(rs.getString("reply_content"));
				mm.setReply_date(rs.getString("reply_date"));
				mm.setReply_ref(rs.getInt("reply_ref"));
				mm.setReply_lev(rs.getInt("reply_lev"));
				mm.setReply_seq(rs.getInt("reply_seq"));
				
				arr.add(mm);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		dbclose();
		return arr;
	}
	
	public boolean deleteReply(int reply_num) { // mypet 댓글 삭제
		
		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format("delete from mypetReply where reply_num = "+reply_num);
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
					"select max(reply_seq) from mypetReply where reply_ref = "+reply_ref);
			if (rs.next()) {
				max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return max;
	}
	
	public boolean insertRe_Reply(ModelMypet mm, int reply_seq) { // 댓글에 답글다는 메소드
		
		dbconnect();
		int num = 0;
		int re_lev = mm.getReply_lev()+1;
		
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select max(reply_num) from mypetReply");

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			String sql = String.format(
					"insert into mypetReply values (%d,'%s',%d,'%s',now(),%d,%d,%d)",
					num,mm.getId(),mm.getMypet_num(),mm.getReply_content(),mm.getReply_ref(),re_lev,reply_seq+1);
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
	
	public ArrayList<ModelMypet> selectRequest(String id) { // 친구요청 온거 전부 select
		
		dbconnect();
		ArrayList<ModelMypet> arr = new ArrayList<ModelMypet>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select * from requestFriend,customer where requestFriend.request_id=customer.id and get_id = '"+id+"'");
			while (rs.next()) {
				ModelMypet mm = new ModelMypet();
				mm.setId(rs.getString("id"));
				mm.setName(rs.getString("name"));
				
				arr.add(mm);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}

}
