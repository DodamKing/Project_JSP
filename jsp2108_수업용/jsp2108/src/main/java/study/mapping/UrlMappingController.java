package study.mapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.url")  /* / 쓰지 마라 여긴 쓰면 안돼*/
public class UrlMappingController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    StringBuffer url = request.getRequestURL(); 
	    System.out.println("url : " + url);
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		System.out.println("com : " + com);
		
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('콘솔창을 확인하세요');");
		out.println("location.href = '" + request.getContextPath() + "/URLMapping';");
		out.println("</script>");
	}
}
