package schedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.sc")
public class ScheduleController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ScheduleInterface command = null;
		String viewPage = "/WEB-INF/schedule";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if (com.equals("/schedule")) {
			viewPage += "/schedule.jsp";
		}

		else if (com.equals("/scContent")) {
			command = new ScContentCommand();
			command.execute(request, response);
			viewPage += "/scContent.jsp";
		}
	
		else if (com.equals("/scContentOk")) {
			command = new ScContentOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}

		else if (com.equals("/scDelete")) {
			command = new ScDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
