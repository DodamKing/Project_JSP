package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoDeleteCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = 0;
		int pag = 1;
		int pageSize = 5;
		
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if (request.getParameter("pag") != null) {
			pag = Integer.parseInt(request.getParameter("pag"));
		}
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		
		BoardDAO dao = new BoardDAO();
		int res = dao.setBoardDelete(idx);
		
		if (res != 0) {
			request.setAttribute("msg", "boDeleteOk");
			request.setAttribute("url", "boList.bo?pag=" + pag + "&pageSize=" + pageSize);
		}
		else {
			request.setAttribute("msg", "boDeleteNo");
			request.setAttribute("url", "boContent.bo?idx=" + idx +"&pag=" + pag + "&pageSize=" + pageSize);
		}
	}

}
