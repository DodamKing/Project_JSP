package password;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/passwordOk2")
public class PasswordOk2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = "";
		String pwd = "";
		
		if (request.getParameter("mid") != null) {
			mid = request.getParameter("mid");
		}
		if (request.getParameter("pwd") != null) {
			pwd = request.getParameter("pwd");
		}
		pwd = pwd.toUpperCase();
		
		System.out.println("mid: " + mid);
		System.out.println("pwd: " + pwd);
		
		long key = 0x1234ABCD;
		long encPwd;
		String decPwd = "";
		long intPwd;
		String strPwd = "";

		for (int i=0; i<pwd.length(); i++) {
			intPwd = (long) pwd.charAt(i);
			strPwd += intPwd;
		}
		
		System.out.println("strPwd: " + strPwd);
		
		intPwd = Long.parseLong(strPwd);
		
		encPwd = intPwd ^ key; //키 값으로 암호화 시키는 중 인코딩
		System.out.println("인코딩한 pwd: " + encPwd);
		
		intPwd = encPwd ^ key;
		strPwd = String.valueOf(intPwd);
		
		for (int i=0; i<strPwd.length(); i+=2) {
			decPwd += (char) (Integer.parseInt(strPwd.substring(i, i+2)));
		}
		
		System.out.println("디코딩한 pwd: " + intPwd);
		System.out.println("복원 pwd: " + decPwd);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('콘솔에 값 있음')");
		out.println("location.href='" + request.getContextPath() + "/password';");
		out.println("</script>");
		
//		String url = "";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	}
}
