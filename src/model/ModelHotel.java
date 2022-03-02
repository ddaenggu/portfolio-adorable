package model;

public class ModelHotel {
	
	public int hotelcode; // hotel table
	public String hotelname;
	public String hoteladdress;
	public String hotelpage;
	public String hotelnum;
	
	public int roomcode; // hotelRoom table
	public String roomname;
	public int room_quantity;
	public int weekday_price;
	public int weekend_price;
	public int people_num;
	
	public int hb_num; // hotelBoard table
	public String hotel_img;
	public String room_img;
	public String room_info1;
	public String room_info2;
	public String room_info3;
	public String room_info4;
	public String room_info5;
	
	public int book_num; // hotelBook table
	public String bookcode;
	public int price;
	public int book_peoplenum;
	public int book_usepoint;
	public String checkin_date;
	public String checkout_date;
	public String book_date;
	
	public String id; // customer table
	public String name;
	public String num_front;
	public String num_middle;
	public String num_back;
	public String mail_front;
	public String mail_back;
	public int point;
	
	public int getHotelcode() {
		return hotelcode;
	}
	public void setHotelcode(int hotelcode) {
		this.hotelcode = hotelcode;
	}
	public String getHotelname() {
		return hotelname;
	}
	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}
	public String getHoteladdress() {
		return hoteladdress;
	}
	public void setHoteladdress(String hoteladdress) {
		this.hoteladdress = hoteladdress;
	}
	public String getHotelpage() {
		return hotelpage;
	}
	public void setHotelpage(String hotelpage) {
		this.hotelpage = hotelpage;
	}
	public String getHotelnum() {
		return hotelnum;
	}
	public void setHotelnum(String hotelnum) {
		this.hotelnum = hotelnum;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public int getRoom_quantity() {
		return room_quantity;
	}
	public void setRoom_quantity(int room_quantity) {
		this.room_quantity = room_quantity;
	}
	public int getWeekday_price() {
		return weekday_price;
	}
	public void setWeekday_price(int weekday_price) {
		this.weekday_price = weekday_price;
	}
	public int getWeekend_price() {
		return weekend_price;
	}
	public void setWeekend_price(int weekend_price) {
		this.weekend_price = weekend_price;
	}
	public int getPeople_num() {
		return people_num;
	}
	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}
	public int getHb_num() {
		return hb_num;
	}
	public void setHb_num(int hb_num) {
		this.hb_num = hb_num;
	}
	public String getHotel_img() {
		return hotel_img;
	}
	public void setHotel_img(String hotel_img) {
		this.hotel_img = hotel_img;
	}
	public String getRoom_img() {
		return room_img;
	}
	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}
	public String getRoom_info1() {
		return room_info1;
	}
	public void setRoom_info1(String room_info1) {
		this.room_info1 = room_info1;
	}
	public String getRoom_info2() {
		return room_info2;
	}
	public void setRoom_info2(String room_info2) {
		this.room_info2 = room_info2;
	}
	public String getRoom_info3() {
		return room_info3;
	}
	public void setRoom_info3(String room_info3) {
		this.room_info3 = room_info3;
	}
	public String getRoom_info4() {
		return room_info4;
	}
	public void setRoom_info4(String room_info4) {
		this.room_info4 = room_info4;
	}
	public String getRoom_info5() {
		return room_info5;
	}
	public void setRoom_info5(String room_info5) {
		this.room_info5 = room_info5;
	}
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public String getBookcode() {
		return bookcode;
	}
	public void setBookcode(String bookcode) {
		this.bookcode = bookcode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBook_usepoint() {
		return book_usepoint;
	}
	public void setBook_usepoint(int book_usepoint) {
		this.book_usepoint = book_usepoint;
	}
	public String getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(String checkin_date) {
		this.checkin_date = checkin_date;
	}
	public String getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(String checkout_date) {
		this.checkout_date = checkout_date;
	}
	public int getBook_peoplenum() {
		return book_peoplenum;
	}
	public void setBook_peoplenum(int book_peoplenum) {
		this.book_peoplenum = book_peoplenum;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNum_front() {
		return num_front;
	}
	public void setNum_front(String num_front) {
		this.num_front = num_front;
	}
	public String getNum_middle() {
		return num_middle;
	}
	public void setNum_middle(String num_middle) {
		this.num_middle = num_middle;
	}
	public String getNum_back() {
		return num_back;
	}
	public void setNum_back(String num_back) {
		this.num_back = num_back;
	}
	public String getMail_front() {
		return mail_front;
	}
	public void setMail_front(String mail_front) {
		this.mail_front = mail_front;
	}
	public String getMail_back() {
		return mail_back;
	}
	public void setMail_back(String mail_back) {
		this.mail_back = mail_back;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}

}
