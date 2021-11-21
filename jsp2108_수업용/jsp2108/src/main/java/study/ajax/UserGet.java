package study.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.mapping2.UserDAO;
import study.mapping2.UserVO;

@WebServlet("/usergetuser")
public class UserGet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		
		List<UserVO> vos = dao.getUserList();
		
		request.setAttribute("vos", vos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ajax1");
		dispatcher.forward(request, response);
	}
}
