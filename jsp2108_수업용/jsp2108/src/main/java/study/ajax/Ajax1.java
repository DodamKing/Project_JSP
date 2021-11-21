package study.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

@WebServlet("/ajax1Ok")
public class Ajax1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = ""; 
		if (request.getParameter("mid") != null) {
			mid = request.getParameter("mid");
		}
		
		MemberDAO dao = new MemberDAO();
		String name = dao.idCheck(mid);
		response.getWriter().write(name);
//		response.getWriter().write(searchName(name));
	}

//	private String searchName(String name) {
//		return name;
//	}
}
