package model;

public class ModelProduct {
	
	public int pro_code; // product table
	public String pro_name;
	public String pro_size;
	public String pro_color;
	public int pro_quantity;
	public int pro_price;
	public String category;
	public String recommend;
	
	public int pb_num; // productBoard table
	public String pb_title;
	public String pb_img1;
	public String pb_img2;
	public String pb_info1;
	public String pb_info2;
	public String pb_info3;
	public String pb_info4;
	public String pb_info5;
	public String pb_date;
	
	public int cart_num; // cart table
	public int cart_quantity;
	public int cart_price;
	
	public int order_num; // order table
	public String ordercode;
	public int order_quantity;
	public int order_deliveryprice;
	public int order_usepoint;
	public String order_date;
	public String order_zipcode;
	public String order_address;
	public String order_detailaddress;
	public String order_extraaddress;
	
	public String id; // customer table
	public String name;
	public String num_front;
	public String num_middle;
	public String num_back;
	public String zipcode;
	public String address;
	public String detailaddress;
	public String extraaddress;
	public int point;
	public String petskind;
	
	public String getPetskind() {
		return petskind;
	}
	public void setPetskind(String petskind) {
		this.petskind = petskind;
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
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getExtraaddress() {
		return extraaddress;
	}
	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_size() {
		return pro_size;
	}
	public void setPro_size(String pro_size) {
		this.pro_size = pro_size;
	}
	public String getPro_color() {
		return pro_color;
	}
	public void setPro_color(String pro_color) {
		this.pro_color = pro_color;
	}
	public int getPro_quantity() {
		return pro_quantity;
	}
	public void setPro_quantity(int pro_quantity) {
		this.pro_quantity = pro_quantity;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public int getPb_num() {
		return pb_num;
	}
	public void setPb_num(int pb_num) {
		this.pb_num = pb_num;
	}
	public String getPb_title() {
		return pb_title;
	}
	public void setPb_title(String pb_title) {
		this.pb_title = pb_title;
	}
	public String getPb_img1() {
		return pb_img1;
	}
	public void setPb_img1(String pb_img1) {
		this.pb_img1 = pb_img1;
	}
	public String getPb_img2() {
		return pb_img2;
	}
	public void setPb_img2(String pb_img2) {
		this.pb_img2 = pb_img2;
	}
	public String getPb_info1() {
		return pb_info1;
	}
	public void setPb_info1(String pb_info1) {
		this.pb_info1 = pb_info1;
	}
	public String getPb_info2() {
		return pb_info2;
	}
	public void setPb_info2(String pb_info2) {
		this.pb_info2 = pb_info2;
	}
	public String getPb_info3() {
		return pb_info3;
	}
	public void setPb_info3(String pb_info3) {
		this.pb_info3 = pb_info3;
	}
	public String getPb_info4() {
		return pb_info4;
	}
	public void setPb_info4(String pb_info4) {
		this.pb_info4 = pb_info4;
	}
	public String getPb_info5() {
		return pb_info5;
	}
	public void setPb_info5(String pb_info5) {
		this.pb_info5 = pb_info5;
	}
	public String getPb_date() {
		return pb_date;
	}
	public void setPb_date(String pb_date) {
		this.pb_date = pb_date;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public int getCart_price() {
		return cart_price;
	}
	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public int getOrder_deliveryprice() {
		return order_deliveryprice;
	}
	public void setOrder_deliveryprice(int order_deliveryprice) {
		this.order_deliveryprice = order_deliveryprice;
	}
	public int getOrder_usepoint() {
		return order_usepoint;
	}
	public void setOrder_usepoint(int order_usepoint) {
		this.order_usepoint = order_usepoint;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_zipcode() {
		return order_zipcode;
	}
	public void setOrder_zipcode(String order_zipcode) {
		this.order_zipcode = order_zipcode;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_detailaddress() {
		return order_detailaddress;
	}
	public void setOrder_detailaddress(String order_detailaddress) {
		this.order_detailaddress = order_detailaddress;
	}
	public String getOrder_extraaddress() {
		return order_extraaddress;
	}
	public void setOrder_extraaddress(String order_extraaddress) {
		this.order_extraaddress = order_extraaddress;
	}

}
