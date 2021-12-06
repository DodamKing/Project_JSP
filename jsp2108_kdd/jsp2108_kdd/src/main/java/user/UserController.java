package user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.user")
public class UserController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInterface command = null;
		String view = "/WEB-INF/view";
		String message = "/WEB-INF/view/message.jsp";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if (com.equals("/userlogin")) {
			view += "/login.jsp";
		}
		
		else if (com.equals("/userlogindo")) {
			command = new UserLoginDo();
			command.execute(request, response);
			view = message;
		}
		
		else if (com.equals("/usersignup")) {
			view += "/signup.jsp";
		}
		
		else if (com.equals("/useroverlapcheck")) {
			command = new UserOverlapCheck();
			command.execute(request, response);
			view += "/useroverlapcheck.jsp";
		}

		else if (com.equals("/usersignupdo")) {
			command = new UserSignUpDo();
			command.execute(request, response);
			view = message;
		}
		
		else if (com.equals("/userlogout")) {
			command = new UserLogOutDo();
			command.execute(request, response);
			view += "/main.jsp";
		}
		
		else if (com.equals("/userprofile")) {
			command = new UserUpdateCommand();
			command.execute(request, response);
			view += "/userProfile.jsp";
		}

		else if (com.equals("/userupdate")) {
			command = new UserUpdateCommand();
			command.execute(request, response);
			view += "/userUpdate.jsp";
		}
		
		else if (com.equals("/userupdatedo")) {
			command = new UserUpdateDo();
			command.execute(request, response);
			view = "userprofile.user";
		}

		else if (com.equals("/userdel")) {
			command = new UserDelDo();
			command.execute(request, response);
			view = message;
		}

		else if (com.equals("/usermembership")) {
			command = new UserMemberShipCommand();
			command.execute(request, response);
			view += "/userMembership.jsp";
		}

		else if (com.equals("/membershipdo")) {
			command = new UserMemberShipDoCommand();
			command.execute(request, response);
			return;
		}

		else if (com.equals("/usersaveplaylist")) {
			command = new UserSavePlayListDoCommand();
			command.execute(request, response);
			return;
		}
		
		else if (com.equals("/userdelplaylist")) {
			command = new UserdelPlayListDoCommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
