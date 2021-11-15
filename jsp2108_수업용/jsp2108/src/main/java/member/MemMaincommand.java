package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemMaincommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int Lv = -1;
		String grade = "";
		HttpSession session = request.getSession();
		
		if (session.getAttribute("sLv") != null) {
	 		Lv = (int) session.getAttribute("sLv");
		}
	 	
	 	if (Lv == 0) grade = "관리자";
	 	if (Lv == 1) grade = "준회원";
	 	if (Lv == 2) grade = "정회원";
	 	if (Lv == 3) grade = "우수회원";
	 	
	 	
	 	
	 	session.setAttribute("sGrade", grade);
	 	
	}

}
