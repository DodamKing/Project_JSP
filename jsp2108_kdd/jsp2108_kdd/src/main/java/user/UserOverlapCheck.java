package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserOverlapCheck implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String userId = "";
		if (request.getParameter("userId") != null) {
			userId = request.getParameter("userId");
		}
		
		UserDAO dao = new UserDAO();
		int res = dao.checkUserId(userId);
		request.setAttribute("res", res);
		request.setAttribute("mid", userId);
	}

}
