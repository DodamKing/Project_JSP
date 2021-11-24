package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserDelDo implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("sMid");
		session.invalidate();
		
		UserDAO dao = new UserDAO();
		int res = dao.signOut(userId);
		
		if (res != 0) {
			request.setAttribute("res", "signOutsuccess");
			request.setAttribute("url", "today");
		}
		else {
			request.setAttribute("res", "fales");
			request.setAttribute("url", "userprofile.user");
		}
	}

}
