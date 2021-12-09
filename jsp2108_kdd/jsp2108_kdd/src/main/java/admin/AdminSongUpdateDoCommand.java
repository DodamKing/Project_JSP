package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import song.SongDAO;

public class AdminSongUpdateDoCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		int sw = Integer.parseInt(request.getParameter("sw"));
		String items = request.getParameter("item");
		int pageNo = 1;
		
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		
		if (items != null) {
			String[] item = items.split("/");
			for (int i=0; i<item.length; i++) {
				int idx = Integer.parseInt(item[i].split("_")[1]);
				String column = item[i].split("_")[0];
				String name = column + "_" + idx;
				String value = request.getParameter(name);
				
				SongDAO dao = new SongDAO();
				dao.setAdminSongUpdate(idx, column, value);
			}
		}
		
		request.setAttribute("sw", sw);
		request.setAttribute("pageNo", pageNo);
	}

}
