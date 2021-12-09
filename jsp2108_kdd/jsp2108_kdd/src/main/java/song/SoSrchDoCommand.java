package song;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SoSrchDoCommand implements SongInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String srchKwd = "";
		if (request.getParameter("srchKwd") != null) {
			srchKwd = request.getParameter("srchKwd");
		}
		
		if (!srchKwd.equals("")) {
			SongDAO dao = new SongDAO();
			List<SongVO> vos = dao.getSrchResult(srchKwd);
			
			request.setAttribute("vos", vos);
		}
	}

}
