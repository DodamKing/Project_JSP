package study;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/study";
				
		if (com.equals("/el1")) {
			viewPage += "/el/el1.jsp";
		}
		else if (com.equals("/el2")) {
			viewPage += "/el/el2.jsp";
		}
		else if (com.equals("/jstl1")) {
			viewPage += "/jstl/jstl1.jsp";
		}
		else if (com.equals("/jstl2")) {
			command = new jstl2Command();
			command.execute(request, response);
			viewPage += "/jstl/jstl2.jsp";
		}
		else if (com.equals("/jstl3")) {
			viewPage += "/jstl/jstl3.jsp";
		}
		else if (com.equals("/ajax1")) {
			command = new Ajax1Command();
			command.execute(request, response);
			viewPage += "/ajax/ajax1.jsp";
		}
		else if (com.equals("/ajax2")) {
			viewPage += "/ajax/ajax2.jsp";
		}
		else if (com.equals("/userUpdate")) {
			command = new UserUpdateCommand();
			command.execute(request, response);
			viewPage += "/ajax/userUpdate.jsp";
		}
		else if (com.equals("/userUpdateOk")) {
			command = new UserUpdateOkCommand();
			command.execute(request, response);
			viewPage += "/ajax/userUpdate.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
