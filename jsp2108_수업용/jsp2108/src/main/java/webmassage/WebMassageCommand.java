package webmassage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WebMassageCommand implements WMInterFace {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String send = request.getParameter("send");
		WebMassageDAO dao = new WebMassageDAO();
		
		
		int mSw = 1;
		int idx = 0;
		if (request.getParameter("mSw") != null) {
			mSw = Integer.parseInt(request.getParameter("mSw"));
		}
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		
		
		if (mSw == 6) {
			WebMassageVO vo = dao.getWebMessageContent(idx, mid); 
			request.setAttribute("vo", vo);
		}

		
		List<WebMassageVO> vos = dao.getWebMessageList(mid, mSw);
		request.setAttribute("vos", vos);
		
		
		request.setAttribute("mSw", mSw);
		request.setAttribute("send", send);
			
		
	}

}
