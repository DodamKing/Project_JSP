package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserSignUpDo implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String userId = "";
		String pwd = "";
		String email = "";
		String telecom = "";
		String phoneNb = "";
		String userNm = "";
		String nickNm = "";
		
		if (request.getParameter("userId") != null) {
			userId = request.getParameter("userId");
		}
		if (request.getParameter("pwd") != null) {
			pwd = request.getParameter("pwd");
		}
		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
		}
		if (request.getParameter("telecom") != null) {
			telecom = request.getParameter("telecom");
		}
		if (request.getParameter("phoneNb") != null) {
			phoneNb = request.getParameter("phoneNb");
		}
		if (request.getParameter("userNm") != null) {
			userNm = request.getParameter("userNm");
		}
		if (request.getParameter("nickNm") != null) {
			nickNm = request.getParameter("nickNm");
		}
		
		UserDAO dao = new UserDAO();
		
		pwd = pwd.toUpperCase();
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
		
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setPwdKeyNo(pwdKeyNo);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setTelecom(telecom);
		vo.setPhoneNb(phoneNb);
		vo.setUserNm(userNm);
		vo.setNickNm(nickNm);
		
		int res = dao.insertUser(vo);
		
		if (res == -1) {
			request.setAttribute("res", "signupFalse");
			request.setAttribute("url", "usersignup.user");
		} 
		else {
			request.setAttribute("res", "signupSuccess");
			request.setAttribute("url", "userlogin.user");
		}
	}

}
