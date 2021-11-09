package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GInputOk")
public class GInputOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = "";
		String email = "";
		String homepage = "";
		String content = "";
		
		if (request.getParameter("name") != null) {
			name = request.getParameter("name");
		}
		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
		}
		if (request.getParameter("homepage") != null) {
			homepage = request.getParameter("homepage");
		}
		if (request.getParameter("content") != null) {
			content = request.getParameter("content");
		}
		
		name = name.replace("<", "&lt;");
		name = name.replace(">", "&gt;");
		
		GuestVO vo = new GuestVO();
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomepage(homepage);
		vo.setContent(content);
		vo.setHostIp(request.getParameter("hostIp"));
		
		GuestDAO dao = new GuestDAO();
		int res = dao.gInputOk(vo);
		PrintWriter out = response.getWriter();
		
		if (res == -1) {
			out.println("<script>");
			out.println("alert('방명록 등록에 실패하였습니다.')");
			out.println("location.href='" + request.getContextPath() + "/guest/gInput.jsp'");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('방명록이 정상적으로 등록 되었습니다.')");
			out.println("location.href='" + request.getContextPath() + "/guest/gList.jsp'");
			out.println("</script>");
		}
	}
}
