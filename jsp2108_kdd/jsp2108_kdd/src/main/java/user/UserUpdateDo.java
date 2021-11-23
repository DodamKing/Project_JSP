package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserUpdateDo implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String userId = "";
		String email = "";
		String telecom = "";
		String phoneNb = "";
		String userNm = "";
		String nickNm = "";
		
		if (request.getParameter("userId") != null) {
			userId = request.getParameter("userId");
		}
		if (request.getParameter("telecom") != null) {
			telecom = request.getParameter("telecom");
		}
		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
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
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setEmail(email);
		vo.setTelecom(telecom);
		vo.setPhoneNb(phoneNb);
		vo.setUserNm(userNm);
		vo.setNickNm(nickNm);
		
		dao.setUserUpdate(vo); 
	}

}
