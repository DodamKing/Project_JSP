package song;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetLyricsCommand implements SongInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String artist = request.getParameter("artist");
		
		if (title != null) {
			SongDAO dao = new SongDAO();
			String lyrics = dao.getLyrics(title, artist);
			
			if (lyrics != null) {
				response.getWriter().write(lyrics);
			}
			else {
				response.getWriter().write("준비중 입니다.");
			}
		}
	}

}
