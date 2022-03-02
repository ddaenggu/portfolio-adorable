package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Model;
import model.ModelProduct;

public class Control {

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
	
	// qna게시판

	public boolean insertBoard(Model md) { // 게시판에 글 쓴 내용 db에 저장하는 메소드
		dbconnect();

		try {
			stmt = conn.createStatement();
			String sql = String.format("insert into qnaBoard (board_num,id,board_title,board_content,board_date,"
					+ "board_pw,board_result) values (default,'%s','%s','%s',now(),'%s','0');"
					,md.getId(),md.getBoard_title(),md.getBoard_content(),md.getBoard_pw());
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
	
	public ArrayList<Model> selectboard() { // 게시판에 글 전체 나타내는 메소드
		dbconnect();
		
		ArrayList<Model> arr = new ArrayList<Model>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select board_num,board_title,concat(left(name,2),'*') as "
					+ "name,board_date,if(board_result like '0','답변대기','답변완료') as board_result from qnaBoard,customer "
					+ "where qnaBoard.id=customer.id order by board_num desc");
			while (rs.next()) {
				Model md = new Model();
				md.board_num = rs.getInt("board_num");
				md.board_title = rs.getString("board_title");
				md.name = rs.getString("name");
				md.board_date = rs.getString("board_date");
				md.board_result = rs.getString("board_result");
				
				arr.add(md);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public Model readcontent(int board_num) { // 게시판에서 글 클릭했을때 선택한 글 select해서 보는 메소드
		dbconnect();
		
		Model md = new Model();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select board_num,board_title,concat(left(name,2),'*') "
					+ "as name,board_date,board_content,qnaBoard.id from qnaBoard,customer "
					+ "where qnaBoard.id=customer.id and qnaBoard.board_num = '"+board_num+"'");
			if (rs.next()) {
				md.board_num = rs.getInt("board_num");
				md.board_title = rs.getString("board_title");
				md.name = rs.getString("name");
				md.board_date = rs.getString("board_date");
				md.board_content = rs.getString("board_content");
				md.id = rs.getString("id");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return md;
	}
	
	public Model selectReply(int board_num) { // 게시글 눌렀을 때 답변 select
		dbconnect();
		
		Model md = new Model();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select board_reply from qnaBoard where board_num = '"+board_num+"'");
			if (rs.next()) {
				md.board_reply = rs.getString("board_reply");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return md;
	}
	
	public boolean updateBoard(Model md) { // 게시판 글 수정하는 메소드
		dbconnect();
		
		try {
			stmt = conn.createStatement();
			String sql = String.format("update qnaBoard set board_title='"+md.getBoard_title()+
					"',board_content='"+md.getBoard_content()+"',board_date=now() "
					+ "where board_num="+md.getBoard_num());
			int st = stmt.executeUpdate(sql);
			if (st > 0) {
				return true;
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public ArrayList<Model> selectMyContent(String user) { // 내가 쓴 글을 나타내는 메소드
		dbconnect();
		
		ArrayList<Model> arr = new ArrayList<Model>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select board_num,board_title,concat(left(name,2),'*') as "
					+ "name,board_date,if(board_result like '0','답변대기','답변완료') as board_result from qnaBoard,customer "
					+ "where qnaBoard.id=customer.id and qnaBoard.id='"+user+"'order by board_num desc");
			while (rs.next()) {
				Model md = new Model();
				md.board_num = rs.getInt("board_num");
				md.board_title = rs.getString("board_title");
				md.name = rs.getString("name");
				md.board_date = rs.getString("board_date");
				md.board_result = rs.getString("board_result");
				
				arr.add(md);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public boolean deleteBoard(Model md) { // 내 게시글 삭제하는 메소드
		dbconnect();
		
		try {
			stmt = conn.createStatement();
			String sql = String.format("delete from qnaBoard where board_num ="+md.getBoard_num());
			int st = stmt.executeUpdate(sql);
			
			return true;
		}
		catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	public ArrayList<Model> searchqnaBorad(String search) { // 게시판 검색기능
		dbconnect();
		
		ArrayList<Model> arr = new ArrayList<Model>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select board_num,board_title,concat(left(name,2),'*') as "
					+ "name,board_date,if(board_result like '0','답변대기','답변완료') as board_result from qnaBoard,customer "
					+ "where qnaBoard.id=customer.id and board_title like '%"+search+"%' order by board_num desc");
			while (rs.next()) {
				Model md = new Model();
				md.board_num = rs.getInt("board_num");
				md.board_title = rs.getString("board_title");
				md.name = rs.getString("name");
				md.board_date = rs.getString("board_date");
				md.board_result = rs.getString("board_result");
				
				arr.add(md);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public boolean selectCheckpw(Model md) { // 글 보기위해서 비밀번호확인하는 곳
		
		dbconnect();
		ModelProduct mp = new ModelProduct();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from qnaBoard where board_num = "+md.getBoard_num()+" and board_pw = '"+md.getBoard_pw()+"'" );
			if (rs.next()) {
				return true;
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return false;
	}
	
	
	
	
	// product 게시물보는 것 관련
	public ModelProduct selectProductBoard(String pb_title) { // loginlookitems.jsp로 갔을때 제품 게시글 보는 것 내용 select
		dbconnect();
		
		ModelProduct mp = new ModelProduct();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from productBoard where pb_title = '"+pb_title+"'");
			if (rs.next()) {
				mp.pb_title = rs.getString("pb_title");
				mp.pb_img1 = rs.getString("pb_img1");
				mp.pb_img2 = rs.getString("pb_img2");
				mp.pb_info1 = rs.getString("pb_info1");
				mp.pb_info2 = rs.getString("pb_info2");
				mp.pb_info3 = rs.getString("pb_info3");
				mp.pb_info4 = rs.getString("pb_info4");
				mp.pb_info5 = rs.getString("pb_info5");
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return mp;
	}
	
	public ArrayList<ModelProduct> selectProductColor(String pb_title) {
		dbconnect();
		
		ArrayList<ModelProduct> arr = new ArrayList<ModelProduct>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select distinct pro_color from product where pro_name = '"+pb_title+"'" );
			while (rs.next()) {
				ModelProduct mp = new ModelProduct();
				mp.pro_color = rs.getString("pro_color");
				arr.add(mp);			
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public ArrayList<ModelProduct> selectProductSize(String pb_title) {
		dbconnect();
		
		ArrayList<ModelProduct> arr = new ArrayList<ModelProduct>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select distinct pro_size from product where pro_name = '"+pb_title+"'" );
			while (rs.next()) {
				ModelProduct mp = new ModelProduct();
				mp.pro_size = rs.getString("pro_size");
				arr.add(mp);
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public ModelProduct selectProductPrice(String pb_title) {
		dbconnect();
		
		ModelProduct mp = new ModelProduct();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select distinct pro_name, pro_price from product where pro_name = '"+pb_title+"'" );
			if (rs.next()) {
//				mp.pro_code = rs.getInt("pro_code");
				mp.pro_name = rs.getString("pro_name");
				mp.pro_price = rs.getInt("pro_price");
			}
		}
		catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return mp;
	}

}
