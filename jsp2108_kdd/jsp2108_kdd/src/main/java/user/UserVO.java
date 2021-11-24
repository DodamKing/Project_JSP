package user;

public class UserVO {
	private int idx;
	private String userId;
	private int pwdKeyNo;
	private String pwd;
	private String email;
	private String telecom;
	private String phoneNb;
	private String userNm;
	private String nickNm;
	private int membership;
	private String membershipDate;
	private int membershipCnt;
	private String playList;
	private int visible;
	
	
	private String nextMembershipDate;


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


	public int getPwdKeyNo() {
		return pwdKeyNo;
	}


	public void setPwdKeyNo(int pwdKeyNo) {
		this.pwdKeyNo = pwdKeyNo;
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


	public int getMembership() {
		return membership;
	}


	public void setMembership(int membership) {
		this.membership = membership;
	}


	public String getMembershipDate() {
		return membershipDate;
	}


	public void setMembershipDate(String membershipDate) {
		this.membershipDate = membershipDate;
	}


	public int getMembershipCnt() {
		return membershipCnt;
	}


	public void setMembershipCnt(int membershipCnt) {
		this.membershipCnt = membershipCnt;
	}


	public String getPlayList() {
		return playList;
	}


	public void setPlayList(String playList) {
		this.playList = playList;
	}


	public int getVisible() {
		return visible;
	}


	public void setVisible(int visible) {
		this.visible = visible;
	}


	public String getNextMembershipDate() {
		return nextMembershipDate;
	}


	public void setNextMembershipDate(String nextMembershipDate) {
		this.nextMembershipDate = nextMembershipDate;
	}


	@Override
	public String toString() {
		return "UserVO [idx=" + idx + ", userId=" + userId + ", pwdKeyNo=" + pwdKeyNo + ", pwd=" + pwd + ", email="
				+ email + ", telecom=" + telecom + ", phoneNb=" + phoneNb + ", userNm=" + userNm + ", nickNm=" + nickNm
				+ ", membership=" + membership + ", membershipDate=" + membershipDate + ", membershipCnt="
				+ membershipCnt + ", playList=" + playList + ", visible=" + visible + ", nextMembershipDate="
				+ nextMembershipDate + "]";
	}
	
	
}
