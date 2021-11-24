package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import song.SongDAO;

public class UserSavePlayListDoCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String title = request.getParameter("title");
		String artist = request.getParameter("artist");
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		if (mid != null) {
			SongDAO songDAO = new SongDAO();
			int songIdx = songDAO.getSongIdx(title, artist);
			
			UserDAO userDAO = new UserDAO();
			String playList = userDAO.getPlayList(mid);
			playList += songIdx + "/";
			userDAO.setPlayList(mid, playList);
		}
	}

}
