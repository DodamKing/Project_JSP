package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserMemberShipDoCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String mid = "";
		if (request.getParameter("mid") != null) {
			mid = request.getParameter("mid");
		}
		
		UserDAO dao = new UserDAO();
		dao.setMemberShip(mid);
		
		/*
		 * HttpSession session = request.getSession(); UserVO vo =
		 * dao.getMemberShip(mid); session.setAttribute("sMembership",
		 * vo.getMembership());
		 */
	}

}
