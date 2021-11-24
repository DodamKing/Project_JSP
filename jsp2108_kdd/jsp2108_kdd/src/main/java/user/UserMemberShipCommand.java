package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserMemberShipCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		UserDAO dao = new UserDAO();
		UserVO vo = dao.getMemberShip(mid);
		
		request.setAttribute("vo", vo);
	}

}
