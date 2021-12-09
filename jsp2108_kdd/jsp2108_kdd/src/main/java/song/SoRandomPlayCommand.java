package song;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

public class SoRandomPlayCommand implements SongInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SongDAO dao = new SongDAO();
		int songCnt = dao.getSongCnt();
		int idx = (int) (Math.random() * songCnt) + 260;
		
		SongVO vo = dao.getSongvo(idx);
		
		JSONObject object = new JSONObject(vo);
		
		response.getWriter().write(object.toString());
	}

}
