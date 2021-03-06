package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GDelete")
public class GDelete extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html; charset=utf-8");
//		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		GuestDAO dao = new GuestDAO();
		int res = dao.gDelete(idx);
		
		PrintWriter out = response.getWriter();
		
		if (res == -1) {
			out.println("<script>");
			out.println("alert('방명글 삭제 실패.')");
			out.println("location.href='" + request.getContextPath() + "/guest/gList.jsp'");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('방명글 삭제 성공.')");
			out.println("location.href='" + request.getContextPath() + "/guest/gList.jsp'");
			out.println("</script>");
		}
	}
}
