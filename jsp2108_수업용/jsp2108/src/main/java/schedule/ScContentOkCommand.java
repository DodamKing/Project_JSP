package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ScContentOkCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String sDate = request.getParameter("sDate");
		String part = request.getParameter("part");
		String content = request.getParameter("content");
		int idx = 0;
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		
		
		if (mid != null) {
			ScheduleVO vo = new ScheduleVO();
			vo.setIdx(idx);
			vo.setMid(mid);
			vo.setsDate(sDate);
			vo.setPart(part);
			vo.setContent(content);
			
			ScheduleDAO dao = new ScheduleDAO();
			int res = dao.setScContent(vo);
			
			if (res == 1) {
				request.setAttribute("msg", "scInputOk");
			}
			else if (res == 2) {
				request.setAttribute("msg", "scUpdateOk");
			}
			else {
				request.setAttribute("msg", "No");
			}
			
			request.setAttribute("url", "scContent.sc?ymd=" + sDate +"&mid=" + mid);
		}
		
	}

}
