package webmassage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.wm")
public class WebMessageController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WMInterFace command;
		String viewPage = "/WEB-INF/webmassage";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		if (session.getAttribute("sMid") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
			return;
		}
		
		else if (com.equals("/webMassage")) {
			command = new WebMassageCommand();
			command.execute(request, response);
			viewPage += "/webMassage.jsp";
		}
		
		else if (com.equals("/wmInputOk")) {
			command = new WmInputOkeCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}

		else if (com.equals("/wmDelete")) {
			command = new WmDeleteCommand();
			command.execute(request, response);
			return;
		}

		else if (com.equals("/wmDeleteAll")) {
			command = new WmDeleteAllCommand();
			command.execute(request, response);
			return;
		}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
