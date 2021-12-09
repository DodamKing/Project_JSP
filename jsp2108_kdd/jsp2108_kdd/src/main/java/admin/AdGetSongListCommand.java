package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import requestJson.HttpURLConnectionGetJson;
import song.SongDAO;
import song.SongVO;

public class AdGetSongListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		int sw = 0;
		int pageNo = 1;
		
		if (request.getParameter("sw") != null) {
			sw = Integer.parseInt(request.getParameter("sw"));
		}
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		
		if (sw == 0) {
			HttpURLConnectionGetJson song = new HttpURLConnectionGetJson();
			List<requestJson.SongVO> vos = song.getSong();
			request.setAttribute("vos", vos);
		}
		
		else if (sw == 2) {
			SongDAO dao = new SongDAO();
			if (request.getParameter("pageNo") != null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			int pageSize = 10;
			int startNo = (pageNo - 1) * pageSize;
			int lastPageNo = dao.getSongCnt() / 10 + 1;
			if (dao.getSongCnt() % 10 == 0) lastPageNo--;
			List<SongVO> vos = dao.getSongvoAll(startNo);
			request.setAttribute("vos", vos);
			request.setAttribute("lastPageNo", lastPageNo);
		}
		
		
		request.setAttribute("sw", sw);
		request.setAttribute("pageNo", pageNo);
	}

}
