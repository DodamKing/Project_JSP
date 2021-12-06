package song;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SetsoLikeCommand implements SongInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String artist = request.getParameter("artist");
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		SongDAO dao = new SongDAO();
		int idx = dao.getSongIdx(title, artist);
		
		if (idx != 0) {
			dao.setLikeCnt(idx);
			String likeList = "";
			if (likeList != null) {
				dao.getLikeList(idx);
			}
			likeList += mid + "/";
			dao.setLikeList(idx, likeList);
		}
	}

}
