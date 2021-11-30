package song;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetSongInforCommand implements SongInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = 0;
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		
		if (idx != 0) {
			SongDAO dao = new SongDAO();
			SongVO vo = dao.getSongvo(idx);
			
			String img = vo.getImg();
			img = img.replaceFirst("50", "300");
			vo.setImg(img);
			
			request.setAttribute("vo", vo);
		}
		
	}

}
