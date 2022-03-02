package model;

public class ModelMypet {
	
	public int mypet_num; // mypet table
	public String id;
	public String mypet_content;
	public String mypet_img;
	public String mypet_date;
	
	public String name; // customer table
	
	public int request_num; // requestFriend table
	public String request_id;
	public String get_id;
	
	public int friend_num; // mypetFriend table
	public String friendid;
	
	public int reply_num; // mypetReply table
	public String reply_content;
	public String reply_date;
	public int reply_ref;
	public int reply_lev;
	public int reply_seq;
	
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
	public int getRequest_num() {
		return request_num;
	}
	public void setRequest_num(int request_num) {
		this.request_num = request_num;
	}
	public String getRequest_id() {
		return request_id;
	}
	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}
	public String getGet_id() {
		return get_id;
	}
	public void setGet_id(String get_id) {
		this.get_id = get_id;
	}
	public int getFriend_num() {
		return friend_num;
	}
	public void setFriend_num(int friend_num) {
		this.friend_num = friend_num;
	}
	public String getFriendid() {
		return friendid;
	}
	public void setFriendid(String friendid) {
		this.friendid = friendid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMypet_num() {
		return mypet_num;
	}
	public void setMypet_num(int mypet_num) {
		this.mypet_num = mypet_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMypet_content() {
		return mypet_content;
	}
	public void setMypet_content(String mypet_content) {
		this.mypet_content = mypet_content;
	}
	public String getMypet_img() {
		return mypet_img;
	}
	public void setMypet_img(String mypet_img) {
		this.mypet_img = mypet_img;
	}
	public String getMypet_date() {
		return mypet_date;
	}
	public void setMypet_date(String mypet_date) {
		this.mypet_date = mypet_date;
	}

}
