package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.ModelHotel;

public class HotelController {

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

	public ArrayList<ModelHotel> selectHotel() { // 호텔 리스트 select

		dbconnect();
		ArrayList<ModelHotel> arr = new ArrayList<ModelHotel>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("select distinct hotelcode,hotel.hotelname,hoteladdress,hotelpage,hotelnum,hotel_img"
							+ " from hotel,hotelBoard where hotel.hotelname=hotelBoard.hotelname");
			while (rs.next()) {
				ModelHotel m = new ModelHotel();
				m.setHotelcode(rs.getInt("hotelcode"));
				m.setHotelname(rs.getString("hotelname"));
				m.setHoteladdress(rs.getString("hoteladdress"));
				m.setHotelpage(rs.getString("hotelpage"));
				m.setHotelnum(rs.getString("hotelnum"));
				m.setHotel_img(rs.getString("hotel_img"));

				arr.add(m);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		dbclose();
		return arr;
	}

	public ModelHotel selectHotelInfo(ModelHotel mh) { // 호텔선택했을때 호텔정보 select

		dbconnect();
		ModelHotel m = new ModelHotel();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from hotel where hotelname = '" + mh.getHotelname() + "'");
			if (rs.next()) {
				m.setHotelcode(rs.getInt("hotelcode"));
				m.setHotelname(rs.getString("hotelname"));
				m.setHoteladdress(rs.getString("hoteladdress"));
				m.setHotelnum(rs.getString("hotelnum"));

			}
		} catch (Exception e) {
			System.out.println(e);
		}

		dbclose();
		return m;
	}
	
	public ModelHotel selectHotelImage(ModelHotel mh) { // 호텔선택했을때 호텔 이미지 select

		dbconnect();
		ModelHotel m = new ModelHotel();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select distinct hotel_img from hotelBoard where hotelname = '" + mh.getHotelname() + "'");
			if (rs.next()) {
				m.setHotel_img(rs.getString("hotel_img"));

			}
		} catch (Exception e) {
			System.out.println(e);
		}

		dbclose();
		return m;
	}
	
	public int selectMinPrice(int hotelcode) { // 호텔선택했을때 최저가 select
		
		dbconnect();
		int min = 0;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select min(weekday_price) as weekday_price from hotelRoom where hotelcode = "+hotelcode);
			if (rs.next()) {
				min = rs.getInt("weekday_price");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return min;
	}

	public ArrayList<ModelHotel> selectRoom(ModelHotel mh) { // search로 값에 맞는 방 select

		dbconnect();
		ArrayList<ModelHotel> arr = new ArrayList<ModelHotel>();
		int cnt = 0;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("select count(*) from hotelRoom where hotelcode = " + mh.getHotelcode());
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		int rand = (int)(Math.random()*(cnt+1)); // 전체 방 개수 중 랜덤하게 값을 뽑아냄. ( 0 ~ 방개수 사이 )
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from hotelRoom,hotelBoard where hotelRoom.roomname=hotelBoard.roomname "
							+ "and hotelname = '" + mh.getHotelname() + "' and people_num >= " + mh.getPeople_num() + " order by rand() limit "+rand);
			while (rs.next()) {
				ModelHotel m = new ModelHotel();
				m.setHotelcode(rs.getInt("hotelcode"));
				m.setRoomcode(rs.getInt("roomcode"));
				m.setRoomname(rs.getString("roomname"));
				m.setRoom_img(rs.getString("room_img"));
				m.setWeekday_price(rs.getInt("weekday_price"));
				m.setWeekend_price(rs.getInt("weekend_price"));

				arr.add(m);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		dbclose();
		return arr;
	}

	public ModelHotel selectRoomInfo(ModelHotel mh) { // 객실 자세히보기 select

		dbconnect();
		ModelHotel m = new ModelHotel();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select * from hotel,hotelRoom,hotelBoard where hotel.hotelcode=hotelRoom.hotelcode and "
							+ "hotelRoom.roomname=hotelBoard.roomname and hotelBoard.roomname = '" + mh.getRoomname()
							+ "'");
			if (rs.next()) {
				m.setHotelcode(rs.getInt("hotelcode"));
				m.setHotelname(rs.getString("hotelname"));
				m.setRoomname(rs.getString("roomname"));
				m.setHoteladdress(rs.getString("hoteladdress"));
				m.setHotelnum(rs.getString("hotelnum"));
				m.setPeople_num(rs.getInt("people_num"));
				m.setRoom_info1(rs.getString("room_info1"));
				m.setRoom_info2(rs.getString("room_info2"));
				m.setRoom_info3(rs.getString("room_info3"));
				m.setRoom_info4(rs.getString("room_info4"));
				m.setRoom_info5(rs.getString("room_info5"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return m;
	}

	public ModelHotel selectCustomerInfo(String id) { // 예약할때 고객정보 가져오는 메소드

		dbconnect();
		ModelHotel m = new ModelHotel();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from customer where id = '" + id + "'");
			if (rs.next()) {
				m.setName(rs.getString("name"));
				m.setNum_front(rs.getString("num_front"));
				m.setNum_middle(rs.getString("num_middle"));
				m.setNum_back(rs.getString("num_back"));
				m.setMail_front(rs.getString("mail_front"));
				m.setMail_back(rs.getString("mail_back"));
				m.setPoint(rs.getInt("point"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return m;
	}

	public int selectMaxBookNum() { // max(book_num) select 하는 메소드 (bookcode 만들기위해서)

		dbconnect();
		int maxNum = 0;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select max(book_num) from hotelBook");
			if (rs.next()) {
				maxNum = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return maxNum + 1;
	}

	public boolean insertHotelBook(ModelHotel mh) {

		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String.format(
					"insert into hotelBook (book_num,bookcode,id,hotelcode,roomcode,price,book_peoplenum,checkin_date,checkout_date,"
							+ "book_date,book_usepoint) values (default,'%s','%s',%d,%d,%d,%d,'%s','%s',now(),%d);",
					mh.getBookcode(), mh.getId(), mh.getHotelcode(), mh.getRoomcode(), mh.getPrice(), mh.getBook_peoplenum(),
					mh.getCheckin_date(), mh.getCheckout_date(), mh.getBook_usepoint());
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

	public boolean updatePoint(ModelHotel mh) {

		dbconnect();
		try {
			stmt = conn.createStatement();
			String sql = String
					.format("update customer set point = point +" + mh.getPoint() + " where id = '" + mh.getId() + "'");
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

	public ArrayList<ModelHotel> selectMyReservation(String id) {

		dbconnect();
		ArrayList<ModelHotel> arr = new ArrayList<ModelHotel>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select * from hotel,hotelRoom,hotelBoard,hotelBook,customer where hotel.hotelcode=hotelRoom.hotelcode and "
							+ "hotelRoom.roomname=hotelBoard.roomname and hotelRoom.roomcode=hotelBook.roomcode and hotelBook.id=customer.id and "
							+ "hotelBook.id = '" + id + "'");
			while (rs.next()) {
				ModelHotel m = new ModelHotel();
				m.setRoomcode(rs.getInt("roomcode"));
				m.setHotelname(rs.getString("hotelname"));
				m.setRoomname(rs.getString("roomname"));
				m.setRoom_img(rs.getString("room_img"));
				m.setBook_num(rs.getInt("book_num"));
				m.setBookcode(rs.getString("bookcode"));
				m.setPrice(rs.getInt("price"));
				m.setCheckin_date(rs.getString("checkin_date"));
				m.setCheckout_date(rs.getString("checkout_date"));
				m.setBook_peoplenum(rs.getInt("book_peoplenum"));
				m.setBook_date(rs.getString("book_date"));
				m.setName(rs.getString("name"));
				m.setNum_front(rs.getString("num_front"));
				m.setNum_middle(rs.getString("num_middle"));
				m.setNum_back(rs.getString("num_back"));
				m.setMail_front(rs.getString("mail_front"));
				m.setMail_back(rs.getString("mail_back"));

				arr.add(m);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}

	public ArrayList<ModelHotel> selectBookcode(String id) {

		dbconnect();
		ArrayList<ModelHotel> arr = new ArrayList<ModelHotel>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select bookcode from hotelBook where id = '" + id + "' order by bookcode desc");
			while (rs.next()) {
				ModelHotel m = new ModelHotel();
				m.setBookcode(rs.getString("bookcode"));
				
				arr.add(m);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		dbclose();
		return arr;
	}



}
