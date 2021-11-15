package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

public class UserLoginDo implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String userId = "";
		String pwd = "";
		
		if (request.getParameter("userId") != null) {
			userId = request.getParameter("userId");
		}
		
		if (request.getParameter("pwd") != null) {
			pwd = request.getParameter("pwd");
		}
		
		UserDAO dao = new UserDAO();
		
		if (dao.login(userId, pwd)) {
			request.setAttribute("res", "loginSuccess");
			HttpSession session = request.getSession();
			session.setAttribute("sMid", userId);
		}
		else {
			request.setAttribute("res", "loginFalse");
		}
	}

}
