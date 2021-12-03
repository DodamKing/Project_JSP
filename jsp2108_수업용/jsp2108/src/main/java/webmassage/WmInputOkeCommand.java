package webmassage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WmInputOkeCommand implements WMInterFace {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sendId = "";
		String receiveId = "";
		String title = "";
		String content = "";
		
		
		if (request.getParameter("sendId") != null) {
			sendId = request.getParameter("sendId");
		}
		if (request.getParameter("receiveId") != null) {
			receiveId = request.getParameter("receiveId");
		}
		if (request.getParameter("title") != null) {
			title = request.getParameter("title");
		}
		if (request.getParameter("content") != null) {
			content = request.getParameter("content");
		}
		
		WebMassageVO vo = new WebMassageVO();
		vo.setSendId(sendId);
		vo.setReceiveId(receiveId);
		vo.setTitle(title);
		vo.setContent(content);
		
		WebMassageDAO dao = new WebMassageDAO();
		int res = dao.setWmInputOk(vo);
		
		if (res != 0) {
			request.setAttribute("msg", "메일이 전송 되었습니다.");
			request.setAttribute("url", "webMassage.wm?mSw=1");
		}
	
		else {
			request.setAttribute("msg", "메일이 전송에 실패하였습니다.");
			request.setAttribute("url", "webMassage.wm?mSw=0");
		}
			
	}

}
