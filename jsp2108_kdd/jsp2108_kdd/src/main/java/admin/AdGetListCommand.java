package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import song.SongDAO;
import song.SongVO;
import user.UserDAO;
import user.UserVO;

public class AdGetListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		SongDAO dao = new SongDAO();
		
	}

}
