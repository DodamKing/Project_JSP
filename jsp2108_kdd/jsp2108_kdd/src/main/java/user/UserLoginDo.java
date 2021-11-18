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
		
		pwd = pwd.toUpperCase();
		int pwdKeyNo = dao.getKeyNo(userId);
		long pwdKey = dao.getKey(pwdKeyNo);
		long intPwd;
		String strPwd = "";
		
		for (int i=0; i<pwd.length(); i++) {
			intPwd = pwd.charAt(i);
			strPwd += intPwd;
		}
		
		intPwd = Long.parseLong(strPwd);
		long encPwd = intPwd ^ pwdKey;
		pwd = String.valueOf(encPwd);
		
		UserVO vo = dao.getUserVO(userId);
		
		if (dao.login(userId, pwd)) {
			request.setAttribute("res", "loginSuccess");
			request.setAttribute("url", "today");
			HttpSession session = request.getSession();
			session.setAttribute("sVO", vo);
			session.setAttribute("sMid", userId);
		}
		else {
			request.setAttribute("res", "loginFalse");
			request.setAttribute("url", "userlogin.user");
		}
	}

}
