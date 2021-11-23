package user;

public class UserVO {
	private int idx;
	private String userId;
	private String pwd;
	private String email;
	private String telecom;
	private String phoneNb;
	private String userNm;
	private String nickNm;
	private int visible;
	private int membership;
	private int pwdKeyNo;
	
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
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getNickNm() {
		return nickNm;
	}
	public void setNickNm(String nickNm) {
		this.nickNm = nickNm;
	}
	public int getVisible() {
		return visible;
	}
	public void setVisible(int visible) {
		this.visible = visible;
	}
	public int getMembership() {
		return membership;
	}
	public void setMembership(int membership) {
		this.membership = membership;
	}
	public int getPwdKeyNo() {
		return pwdKeyNo;
	}
	public void setPwdKeyNo(int pwdKeyNo) {
		this.pwdKeyNo = pwdKeyNo;
	}
	
	@Override
	public String toString() {
		return "UserVO [idx=" + idx + ", userId=" + userId + ", pwd=" + pwd + ", email=" + email + ", telecom="
				+ telecom + ", phoneNb=" + phoneNb + ", userNm=" + userNm + ", nickNm=" + nickNm + ", visible="
				+ visible + ", membership=" + membership + ", pwdKeyNo=" + pwdKeyNo + "]";
	}
}
