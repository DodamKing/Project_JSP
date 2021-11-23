package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoInputOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = "";
		String title = "";
		String email = "";
		String homePage = "";
		String content = "";
		String hostIp = "";
		String mid = "";
		
		HttpSession session = request.getSession();

		if (session.getAttribute("sNick") != null) {
			nickName = (String) session.getAttribute("sNick");
		}
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
		
		if (session.getAttribute("sMid") != null) {
			mid = (String) session.getAttribute("sMid");
		}
		
		BoardVO vo = new BoardVO();
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		vo.setMid(mid);
		
		BoardDAO dao = new BoardDAO();
		int res = dao.setBoInput(vo);
		
		if (res != 0) {
			request.setAttribute("msg", "boInputOk");
			request.setAttribute("url", "boList.bo");
		}
		else {
			request.setAttribute("msg", "boInputNo");
			request.setAttribute("url", "boInput.bo");
		}
	}

}
