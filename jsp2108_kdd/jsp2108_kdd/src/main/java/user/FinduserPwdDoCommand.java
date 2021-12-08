package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FinduserPwdDoCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String userId = "";
		String phoneNb = "";
		String email = "";
		
		if (request.getParameter("userId") != null) {
			userId = request.getParameter("userId");
		}
		if (request.getParameter("phoneNb") != null) {
			phoneNb = request.getParameter("phoneNb");
		}
		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
		}
		
		UserDAO dao = new UserDAO();
		String pwd_ = "";
		if (dao.checkUserId(userId) == 0) {
			pwd_ = (int) (Math.random() * 10) + "" + (int) (Math.random() * 10) + (int) (Math.random() * 10) + (int) (Math.random() * 10);
			
			String pwd = pwd_.toUpperCase();
			int pwdKeyNo = (int) (Math.random() * 20);
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
			
			dao.setPwdUpdate(userId, pwd, pwdKeyNo);
		}
		
		response.getWriter().write(pwd_);
	}

}
