package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

public class AdContentCommand implements AdimnInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		int newMember = memberDAO.getNewMember();
		request.setAttribute("newMember", newMember);
	}

}
