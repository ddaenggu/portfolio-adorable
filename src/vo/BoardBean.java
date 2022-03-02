package vo;

public class BoardBean {

	private int board_num; // placerecommendBoard table
	private String id;
	private String board_title;
	private String board_content;
	private String board_date;
	private int board_look;
	private String board_img;
	
	private int reply_num; // placerecommentReply table
	private String reply_content;
	private int reply_ref;
	private int reply_lev;
	private int reply_seq;
	private String reply_date;
	
	private String name; // cutomer table에서 이름 가지고 오기 위해서 만들었
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public int getBoard_look() {
		return board_look;
	}
	public void setBoard_look(int board_look) {
		this.board_look = board_look;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
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
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
