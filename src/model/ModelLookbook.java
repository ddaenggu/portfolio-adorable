package model;

public class ModelLookbook {
	
	public int lb_num; // lookbook table
	public String id;
	public String proname;
	public String lb_img;
	public String lb_title;
	public String lb_content;
	public int lb_like;
	public String lb_date;
	
	public int reply_num; // lookbookReply table
	public String reply_content;
	public String reply_date;
	public int reply_ref;
	public int reply_lev;
	public int reply_seq;

	public int like_num; // lookbookLike table
	
	public String name; // customer table
	public int point;
	
	public int order_num; // productOrder table
	public int pro_code;
	
	public String pro_name; // product table

	public int getLb_num() {
		return lb_num;
	}

	public void setLb_num(int lb_num) {
		this.lb_num = lb_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getLb_img() {
		return lb_img;
	}

	public void setLb_img(String lb_img) {
		this.lb_img = lb_img;
	}

	public String getLb_title() {
		return lb_title;
	}

	public void setLb_title(String lb_title) {
		this.lb_title = lb_title;
	}

	public String getLb_content() {
		return lb_content;
	}

	public void setLb_content(String lb_content) {
		this.lb_content = lb_content;
	}

	public int getLb_like() {
		return lb_like;
	}

	public void setLb_like(int lb_like) {
		this.lb_like = lb_like;
	}

	public String getLb_date() {
		return lb_date;
	}

	public void setLb_date(String lb_date) {
		this.lb_date = lb_date;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	
	public int getReply_ref() {
		return reply_ref;
	}

	public void setReply_ref(int reply_ref) {
		this.reply_ref = reply_ref;
	}

	public int getReply_lev() {
		return reply_lev;
	}

	public void setReply_lev(int reply_lev) {
		this.reply_lev = reply_lev;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
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
	
}
