package user;

public class UserVO {
	private int idx;
	private String userId;
	private String pwd;
	private String email;
	private String telecom;
	private String phoneNb;
	private String userNn;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelecom() {
		return telecom;
	}
	public void setTelecom(String telecom) {
		this.telecom = telecom;
	}
	public String getPhoneNb() {
		return phoneNb;
	}
	public void setPhoneNb(String phoneNb) {
		this.phoneNb = phoneNb;
	}
	public String getUserNn() {
		return userNn;
	}
	public void setUserNn(String userNn) {
		this.userNn = userNn;
	}
	
	@Override
	public String toString() {
		return "UserVO [idx=" + idx + ", userId=" + userId + ", pwd=" + pwd + ", email=" + email + ", telecom="
				+ telecom + ", phoneNb=" + phoneNb + ", userNn=" + userNn + "]";
	}
	
}
