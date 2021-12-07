package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserPwdChangeDoCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String pwd1 = "";
		String pwd2 = "";
		String pwd3 = "";
		
		if (request.getParameter("pwd1") != null) {
			pwd1 = request.getParameter("pwd1");
		}
		if (request.getParameter("pwd2") != null) {
			pwd2 = request.getParameter("pwd2");
		}
		if (request.getParameter("pwd3") != null) {
			pwd3 = request.getParameter("pwd3");
		}
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		UserDAO dao = new UserDAO();
		
		pwd1 = pwd1.toUpperCase();
		int pwdKeyNo = dao.getKeyNo(mid);
		long pwdKey = dao.getKey(pwdKeyNo);
		long intPwd;
		String strPwd = "";
		
		for (int i=0; i<pwd1.length(); i++) {
			intPwd = pwd1.charAt(i);
			strPwd += intPwd;
		}
		
		intPwd = Long.parseLong(strPwd);
		long encPwd = intPwd ^ pwdKey;
		pwd1 = String.valueOf(encPwd);
		
		if (!dao.login(mid, pwd1)) {
			request.setAttribute("res", "기존 비밀번호를 확인해 주세요.");
			request.setAttribute("url", "userpwdcha.user");
		}
		else {
			if (pwd2.equals(pwd3)) {
				pwd2 = pwd2.toUpperCase();
				int pwdKeyNo2 = (int) (Math.random() * 20);
				long pwdKey2 = dao.getKey(pwdKeyNo2);
				long intPwd2;
				String strPwd2 = "";
				
				for (int i=0; i<pwd2.length(); i++) {
					intPwd2 = pwd2.charAt(i);
					strPwd2 += intPwd2;
				}
				
				intPwd2 = Long.parseLong(strPwd2);
				long encPwd2 = intPwd2 ^ pwdKey2;
				pwd2 = String.valueOf(encPwd2);
				
				dao.setPwdUpdate(mid, pwd2, pwdKeyNo2);
				
				request.setAttribute("res", "비밀번호가 변경 되었습니다.");
				request.setAttribute("url", "userprofile.user");
			}
		}
		
	}

}
