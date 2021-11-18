package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdimnInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		String mid = "";
		int level = -1;
		HttpSession session = request.getSession();
		
		if (session.getAttribute("sMid") != null) {
			mid = (String) session.getAttribute("sMid");
		}
		if (session.getAttribute("sLv") != null) {
			level = (int) session.getAttribute("sLv");
		}
		
		if (mid == "" || level != 0) {
			viewPage = "/WEB-INF/member/memLogin.jsp";
		}
		
		
		if (com.equals("/adMenu")) {
			viewPage += "/adMenu.jsp";
		}
		else if (com.equals("/adLeft")) {
			viewPage += "/adLeft.jsp";
		}
		else if (com.equals("/adContent")) {
			command = new AdContentCommand();
			command.execute(request, response);
			viewPage += "/adContent.jsp";
		}
		else if (com.equals("/adMemberList")) {
			command = new AdMemberListCommand();
			command.execute(request, response);
			viewPage += "/member/adMemberList.jsp";
		}
		else if (com.equals("/adMemberLevel")) {
			command = new AdMemberLevelCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		else if (com.equals("/adMemberInfor")) {
			command = new AdMemberInforCommand();
			command.execute(request, response);
			viewPage += "/member/adMemberInfor.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
