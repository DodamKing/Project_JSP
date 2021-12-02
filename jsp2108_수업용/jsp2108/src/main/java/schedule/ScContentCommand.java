package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ScContentCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String ymd = request.getParameter("ymd");
		
		ScheduleDAO dao = new ScheduleDAO();
		ScheduleVO vo = dao.getscContent(ymd, mid);
		request.setAttribute("ymd", ymd);
		request.setAttribute("vo", vo);
	}

}
