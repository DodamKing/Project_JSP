package pds;

public class PdsVO {
	private int idx;
	private String mid;
	private String nickName;
	private String fName;
	private String fSName;
	private int fSize;
	private String title;
	private String part;
	private String pwd;
	private String fDate;
	private int downNum;
	private String opewnSw;
	private String content;
	
	
	private int wNdate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public int getfSize() {
		return fSize;
	}
	public void setfSize(int fSize) {
		this.fSize = fSize;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getfDate() {
		return fDate;
	}
	public void setfDate(String fDate) {
		this.fDate = fDate;
	}
	public int getDownNum() {
		return downNum;
	}
	public void setDownNum(int downNum) {
		this.downNum = downNum;
	}
	public String getOpewnSw() {
		return opewnSw;
	}
	public void setOpewnSw(String opewnSw) {
		this.opewnSw = opewnSw;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	public int getwNdate() {
		return wNdate;
	}
	public void setwNdate(int wNdate) {
		this.wNdate = wNdate;
	}
	
	@Override
	public String toString() {
		return "PdsVO [idx=" + idx + ", mid=" + mid + ", nickName=" + nickName + ", fName=" + fName + ", fSName="
				+ fSName + ", fSize=" + fSize + ", title=" + title + ", part=" + part + ", pwd=" + pwd + ", fDate="
				+ fDate + ", downNum=" + downNum + ", opewnSw=" + opewnSw + ", content=" + content + ", wNdate="
				+ wNdate + "]";
	}
}
