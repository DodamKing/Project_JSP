package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVo;

public class AdMemberInforCommand implements AdimnInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberDAO dao = new MemberDAO();
		MemberVo vo = dao.getMemberInfor(idx);
		
		request.setAttribute("vo", vo);
		
	}

}
