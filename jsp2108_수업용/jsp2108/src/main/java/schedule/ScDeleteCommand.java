package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScDeleteCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("idx") != null) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			String ymd = request.getParameter("ymd");
			
			ScheduleDAO dao = new ScheduleDAO();
			int res = dao.setScDelete(idx);
			
			if (res != 0) {
				request.setAttribute("msg", "scDeleteOk");
			}
			else {
				request.setAttribute("msg", "No");
			}
			
			request.setAttribute("ymd", ymd);
			request.setAttribute("url", "schedule.sc?ymd=" + ymd);
			
		}
	}

}
