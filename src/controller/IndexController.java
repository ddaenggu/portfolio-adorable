package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.ModelProduct;
import vo.NoticeDTO;

public class IndexController {

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

	public ArrayList<ModelProduct> selectBestProname() { // 제품 베스트 제품 4개 제품명 select

		dbconnect();
		ArrayList<ModelProduct> arr = new ArrayList<ModelProduct>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select pro_name from adorable.product,adorable.productOrder"
					+ " where adorable.product.pro_code=adorable.productOrder.pro_code"
					+ " group by pro_name order by count(productOrder.pro_code) desc limit 4");
			while (rs.next()) {
				ModelProduct mp = new ModelProduct();
				mp.setPro_name(rs.getString("pro_name"));

				arr.add(mp);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}

	public ArrayList<ModelProduct> selectBestProduct(ArrayList<ModelProduct> list) { // 제품 베스트 제품 4개 select

		dbconnect();
		ArrayList<ModelProduct> arr = new ArrayList<ModelProduct>();
		try {
			stmt = conn.createStatement();
			for (int i = 0; i < list.size(); i++) {
				ModelProduct m = list.get(i);
				ResultSet rs = stmt.executeQuery("select distinct pro_name,pro_price,pb_img1,pb_img2"
						+ " from adorable.product,adorable.productBoard where product.pro_name=productBoard.pb_title"
						+ " and pro_name in ('" + m.getPro_name() + "');");
				while (rs.next()) {
					ModelProduct mp = new ModelProduct();
					mp.setPro_name(rs.getString("pro_name"));
					mp.setPro_price(rs.getInt("pro_price"));
					mp.setPb_img1(rs.getString("pb_img1"));
					mp.setPb_img2(rs.getString("pb_img2"));

					arr.add(mp);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}

	public ArrayList<ModelProduct> selectRecommend(String id) { // 회원정보에 맞게 추천 제품 4개 select

		dbconnect();
		ArrayList<ModelProduct> arr = new ArrayList<ModelProduct>();
		String rec = "";
		try {
			stmt = conn.createStatement();
			ResultSet petskind = stmt.executeQuery("select petskind from customer where id = '"+id+"'");
			if (petskind.next()) {
				rec = petskind.getString(1);
				if (rec.equals("강아지") || rec.equals("고양이")) {
					ResultSet rs = stmt.executeQuery("select distinct pro_name, pb_img1, pb_img2, pro_price"
							+ " from productBoard,product where productBoard.pb_title=product.pro_name and recommend = '"+rec+"'"
							+ " order by rand() limit 4");
					while (rs.next()) {
						ModelProduct mp = new ModelProduct();
						mp.setPro_name(rs.getString("pro_name"));
						mp.setPro_price(rs.getInt("pro_price"));
						mp.setPb_img1(rs.getString("pb_img1"));
						mp.setPb_img2(rs.getString("pb_img2"));
						
						arr.add(mp);
					}
				}
				else {
					ResultSet rs = stmt.executeQuery("select distinct pro_name, pb_img1, pb_img2, pro_price"
							+ " from productBoard,product where productBoard.pb_title=product.pro_name"
							+ " order by rand() limit 4");
					while (rs.next()) {
						ModelProduct mp = new ModelProduct();
						mp.setPro_name(rs.getString("pro_name"));
						mp.setPro_price(rs.getInt("pro_price"));
						mp.setPb_img1(rs.getString("pb_img1"));
						mp.setPb_img2(rs.getString("pb_img2"));
						
						arr.add(mp);
					}
				}
			}
			else {
				ResultSet rs = stmt.executeQuery("select distinct pro_name, pb_img1, pb_img2, pro_price"
						+ " from productBoard,product where productBoard.pb_title=product.pro_name"
						+ " order by rand() limit 4");
				while (rs.next()) {
					ModelProduct mp = new ModelProduct();
					mp.setPro_name(rs.getString("pro_name"));
					mp.setPro_price(rs.getInt("pro_price"));
					mp.setPb_img1(rs.getString("pb_img1"));
					mp.setPb_img2(rs.getString("pb_img2"));
					
					arr.add(mp);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}
	
	public ArrayList<NoticeDTO> selectNotice() { // 공지사항 글 select
		
		dbconnect();
		ArrayList<NoticeDTO> arr = new ArrayList<NoticeDTO>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from noticeBoard order by board_num desc limit 6");
			while (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setBoard_num(rs.getInt("board_num"));
				notice.setBoard_title(rs.getString("board_title"));
				notice.setBoard_date(rs.getString("board_date"));

				arr.add(notice);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}

}
