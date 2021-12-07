package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FinduserIdDoCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String userNm = "";
		String phoneNb = "";
		String email = "";
		
		if (request.getParameter("userNm") != null) {
			userNm = request.getParameter("userNm");
		}
		if (request.getParameter("phoneNb") != null) {
			phoneNb = request.getParameter("phoneNb");
		}
		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
		}
		
		UserDAO dao = new UserDAO();
		String mid = "";
		if (dao.getuserId(userNm, phoneNb, email) != null) {
			mid = dao.getuserId(userNm, phoneNb, email);
		}
		
		response.getWriter().write(mid);
	}

}
