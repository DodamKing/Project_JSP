package pds;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class PdsDeleteCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = 0;
		String pwd = "";
		
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if (request.getParameter("pwd") != null) {
			pwd = request.getParameter("pwd");
		}
		
		SecurityUtil su = new SecurityUtil();
		pwd = su.encryptSHA256(pwd);
		
		PdsDAO dao = new PdsDAO();
		PdsVO vo = dao.getPdsContent(idx);
		
		if (vo.getPwd().equals(pwd)) {
			String[] fSNames = request.getParameter("fSName").split("/");
			String realPath = request.getServletContext().getRealPath("/data/pds/");
			for (String fSName : fSNames) {
				new File(realPath + fSName).delete();
			}
			
			dao.pdsDelete(idx);
			
			response.getWriter().write("1");
		}
		else {
			response.getWriter().write("0");
		}
	}

}
