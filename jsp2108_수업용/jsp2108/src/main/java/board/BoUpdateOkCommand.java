package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoUpdateOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = "";
		String email = "";
		String homePage = "";
		String content = "";
		String hostIp = "";
		int idx = 0;
		int pag = 1;
		int pageSize = 5;
		

		if (request.getParameter("title") != null) {
			title = request.getParameter("title");
		}
		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
		}
		if (request.getParameter("homePage") != null) {
			homePage = request.getParameter("homePage");
		}
		if (request.getParameter("content") != null) {
			content = request.getParameter("content");
		}
		if (request.getParameter("hostIp") != null) {
			hostIp = request.getParameter("hostIp");
		}
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if (request.getParameter("pag") != null) {
			pag = Integer.parseInt(request.getParameter("pag"));
		}
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		vo.setIdx(idx);
		
		BoardDAO dao = new BoardDAO();
		int res = dao.setBoUpdate(vo);
		
		if (res != 0) {
			request.setAttribute("msg", "boUpdateOk");
		}
		else {
			request.setAttribute("msg", "No");
		}
		request.setAttribute("url", "boUpdate.bo?pag=" + pag + "&pageSize=" + pageSize + "&idx=" + idx);
	}

}
