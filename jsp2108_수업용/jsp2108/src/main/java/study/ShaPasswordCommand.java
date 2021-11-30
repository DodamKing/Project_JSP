package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class ShaPasswordCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = "";
		if (request.getParameter("pwd") != null) {
			pwd = request.getParameter("pwd");
		}
		
		SecurityUtil securityUtil = new SecurityUtil();
		String shaPWd = securityUtil.encryptSHA256(pwd);
		
		response.getWriter().write(shaPWd);
	}

}
