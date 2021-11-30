package requestJson;

public class SongVO {
	private int idx;
	private String img;
	private String title;
	private String artist;
	private String album;
	private String releaseDate;
	private String genre;
	private String music;
	private String words;
	private String arranger;
	private String lyrics;
	private int likeCnt;
	private String likeList;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
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
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getWords() {
		return words;
	}
	public void setWords(String words) {
		this.words = words;
	}
	public String getArranger() {
		return arranger;
	}
	public void setArranger(String arranger) {
		this.arranger = arranger;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getLikeList() {
		return likeList;
	}
	public void setLikeList(String likeList) {
		this.likeList = likeList;
	}
	
	@Override
	public String toString() {
		return "SongVO [idx=" + idx + ", img=" + img + ", title=" + title + ", artist=" + artist + ", album=" + album
				+ ", releaseDate=" + releaseDate + ", genre=" + genre + ", music=" + music + ", words=" + words
				+ ", arranger=" + arranger + ", lyrics=" + lyrics + ", likeCnt=" + likeCnt + ", likeList=" + likeList
				+ "]";
	}
	
}
