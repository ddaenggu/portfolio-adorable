package vo;

public class EventDTO {
	
	public String id; // customer table
	public int point;
	
	public int coupon_num; // coupon table
	public int coupon_sum;
	
	public int event_num; // event table
	public String event_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public int getCoupon_sum() {
		return coupon_sum;
	}
	public void setCoupon_sum(int coupon_sum) {
		this.coupon_sum = coupon_sum;
	}
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public String getEvent_date() {
		return event_date;
	}
	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}

}
