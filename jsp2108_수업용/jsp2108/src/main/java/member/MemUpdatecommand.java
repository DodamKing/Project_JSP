package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemUpdatecommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVo vo = dao.loginCheck(mid);
		
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

		vo.setPwd(decPwd);
		
		String[] email = vo.getEmail().split("@");
		request.setAttribute("emain1", email[0]);
		request.setAttribute("emain2", email[1]);
		
		request.setAttribute("gender", vo.getGender());
		
		request.setAttribute("birthday", vo.getBirthday().substring(0, 10));
		
		String[] tel = vo.getTel().split("-");
		request.setAttribute("tel1", tel[0]);
		request.setAttribute("tel2", tel[1]);
		request.setAttribute("tel3", tel[2]);
		
		String[] address = vo.getAddress().split("/");
		request.setAttribute("address1", address[0]);
		request.setAttribute("address2", address[1]);
		request.setAttribute("address3", address[2]);
		request.setAttribute("address4", address[3]);
		
		request.setAttribute("job", vo.getJob());
		
		request.setAttribute("vo", vo);
	}

}
