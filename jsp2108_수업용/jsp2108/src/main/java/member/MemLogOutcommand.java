package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemLogOutcommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("sNick");
		
		session.invalidate();
		
		request.setAttribute("msg", "memberLogOutOk");
		request.setAttribute("val", nick);
		request.setAttribute("url", request.getContextPath() + "/memLogin.mem");
	}

}
