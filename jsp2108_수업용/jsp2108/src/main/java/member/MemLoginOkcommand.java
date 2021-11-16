package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemLoginOkcommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = "";
		String pwd = "";
		
		if (request.getParameter("mid") != null) {
			mid = request.getParameter("mid");
		}
		if (request.getParameter("pwd") != null) {
			pwd = request.getParameter("pwd");
		}
		
		MemberDAO dao = new MemberDAO();
		MemberVo vo = dao.loginCheck(mid);
		
		if (vo.getMid() != null) {
			long pwdValue = (long) dao.getHashTableSearch(vo.getPwdKey());
			long intPwd;
			long encPwd;
			String strPwd;
			String decPwd = "";
			
			intPwd = Long.parseLong(vo.getPwd());
			
			encPwd = intPwd ^ pwdValue;
			strPwd = String.valueOf(encPwd);
			
			for (int i=0; i<strPwd.length(); i+=2) {
				decPwd += (char) (Integer.parseInt(strPwd.substring(i, i+2)));
			}
			
			HttpSession session = request.getSession();
			if (pwd.equals(decPwd)) {
				session.setAttribute("sNick", vo.getNickName());
				session.setAttribute("sMid", mid);
				session.setAttribute("sLv", vo.getLevel());
				session.setAttribute("sLastDate", vo.getLastDate());
				session.setAttribute("sPoint", vo.getPoint());
				
				dao.setLastDateUpdate(mid);
				
				request.setAttribute("msg", "memberLoginOk");
				request.setAttribute("url", request.getContextPath() + "/memMain.mem");
			}
			else {
				request.setAttribute("msg", "memberLoginPwdNo");
				request.setAttribute("url", request.getContextPath() + "/memLogin.mem");
			}
		}
		else {
			request.setAttribute("msg", "memberLoginNo");
			request.setAttribute("url", request.getContextPath() + "/memLogin.mem");
		}
	}

}
