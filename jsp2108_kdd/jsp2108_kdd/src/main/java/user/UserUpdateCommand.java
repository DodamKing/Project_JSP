package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserUpdateCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		HttpSession session = request.getSession();
		String userId = "";
		if (session.getAttribute("sMid") != null) {
			userId = (String) session.getAttribute("sMid") ;
		}
		
		UserDAO dao = new UserDAO();
		UserVO vo = dao.getUserVO(userId);
		
		request.setAttribute("vo", vo);
	}

}
