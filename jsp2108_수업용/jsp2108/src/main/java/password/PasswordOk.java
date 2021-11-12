package password;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/passwordOk")
public class PasswordOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = "";
		int pwd = 0;
		
		if (request.getParameter("mid") != null) {
			mid = request.getParameter("mid");
		}
		if (request.getParameter("pwd") != null) {
			pwd = Integer.parseInt(request.getParameter("pwd"));
		}
		
		System.out.println("mid: " + mid);
		System.out.println("pwd: " + pwd);
		
		int key = 0x1234ABCD;
		int encPwd, decPwd;
		
		encPwd = pwd ^ key; //키 값으로 암호화 시키는 중 인코딩
		System.out.println("인코딩한 pwd: " + encPwd);
		
		decPwd = encPwd ^ key;
		System.out.println("디코딩한 pwd: " + decPwd);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('콘솔에 값 있음')");
		out.println("location.href='" + request.getContextPath() + "/password';");
		out.println("</script>");
		
//		String url = "";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	}
}
