package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserLoginDo;
import user.UserVO;

@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command;
		String view = "/WEB-INF/view/admin";
		String message = "/WEB-INF/view/message.jsp";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("sVO");
		
		if (userVO == null || userVO.getMembership() != -1) {
			view = "today";
		}
		
		else if (com.equals("/adminMain")) {
			command = new AdGetSongListCommand();
			command.execute(request, response);
			view += "/adMain.jsp";
		}

		else if (com.equals("/adminSongUpdate")) {
			command = new AdminSongUpdateDoCommand();
			command.execute(request, response);
			view = "adminMain.ad";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
