package study.mapping;

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

@WebServlet("/URLMappingList")
public class URLMappingList extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "\\WEB-INF\\study\\mapping\\urlMappingList.jsp";
		UserDAO dao = new UserDAO();
		List<UserVO> vos = dao.getUserList();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		request.setAttribute("vos", vos);
		dispatcher.forward(request, response);
	}
}
