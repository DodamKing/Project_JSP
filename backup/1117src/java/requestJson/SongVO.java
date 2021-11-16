package requestJson;

public class SongVO {
	private String img;
	private String title;
	private String artist;
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	
	@Override
	public String toString() {
		return "SongVO [img=" + img + ", title=" + title + ", artist=" + artist + "]";
	}
}
