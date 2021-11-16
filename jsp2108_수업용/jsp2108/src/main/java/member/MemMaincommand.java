package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.GuestDAO;

public class MemMaincommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int Lv = -1;
		String grade = "";
		String mid = "";
		String nick = "";
		HttpSession session = request.getSession();
		
		if (session.getAttribute("sLv") != null) {
	 		Lv = (int) session.getAttribute("sLv");
		}
		if (session.getAttribute("sMid") != null) {
			mid = (String) session.getAttribute("sMid");
		}
		if (session.getAttribute("sNick") != null) {
			nick = (String) session.getAttribute("sNick");
		}
	 	
	 	if (Lv == 0) grade = "관리자";
	 	if (Lv == 1) grade = "준회원";
	 	if (Lv == 2) grade = "정회원";
	 	if (Lv == 3) grade = "우수회원";

	 	session.setAttribute("sGrade", grade);
	 	
	 	MemberDAO dao = new MemberDAO();
	 	
	 	MemberVo vo = dao.getUserInfor(mid);
	  	request.setAttribute("visitCnt", vo.getVisitCnt());
	  	request.setAttribute("todayCnt", vo.getTodayCnt());
	  	request.setAttribute("point", vo.getPoint());
	 	
	  	GuestDAO guestDAO = new GuestDAO();
	  	int guestCnt = guestDAO.getWriteCnt(mid, nick, vo.getName());
	  	request.setAttribute("guestCnt", guestCnt);
	}

}
