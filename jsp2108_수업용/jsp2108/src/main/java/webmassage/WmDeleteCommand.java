package webmassage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WmDeleteCommand implements WMInterFace {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String send = request.getParameter("send");
		WebMassageDAO dao = new WebMassageDAO();
		dao.wmDeleteCheck(idx, send);
		
		/* response.getWriter().write("1"); */
	}

}
