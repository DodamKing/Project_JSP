package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdMemberLevelCommand;

@WebServlet("*.bo")
public class BoController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command;
		String viewPage = "/WEB-INF/board";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		int level = -1;
		HttpSession session = request.getSession();
		
		if (session.getAttribute("sLv") != null) {
			level = (int) session.getAttribute("sLv");
		}
		
		if (level == -1 || level == 1) {
			command = new LoginCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		
		
		else if (com.equals("/boList")) {
			command = new BoListCommand();
			command.execute(request, response);
			viewPage += "/boList.jsp";
		}
		
		else if (com.equals("/boInput")) {
			command = new BoInputCommand();
			command.execute(request, response);
			viewPage += "/boInput.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
