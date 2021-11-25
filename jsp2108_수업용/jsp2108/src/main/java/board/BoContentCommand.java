package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = 0;
		int pag = 1;
		int pageSize = 5;
		int lately = 0;
		int replyIdx = 0;
		
		if (request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if (request.getParameter("pag") != null) {
			pag = Integer.parseInt(request.getParameter("pag"));
		}
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		if (request.getParameter("lately") != null) {
			lately = Integer.parseInt(request.getParameter("lately"));
		}
		if (request.getParameter("replyIdx") != null) {
			replyIdx = Integer.parseInt(request.getParameter("replyIdx"));
		}
		
		
		String sw = "";
		if (request.getParameter("sw") != null) {
			sw = request.getParameter("sw");
		}
		
		BoardDAO dao = new BoardDAO();
		
		HttpSession session = request.getSession();
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if (contentIdx == null) {
			contentIdx = new ArrayList<String>();
			session.setAttribute("sContentIdx", contentIdx);
		}
		String contentidx_ = session.getId() + "board" + idx;
		if (!contentIdx.contains(contentidx_) ) {
			dao.setReadNum(idx);
			contentIdx.add(contentidx_);
		}
		
		BoardVO vo = dao.getBoardContent(idx);

		BoardVO voPrev = dao.getotherBoardContent("prev", idx);
		BoardVO voNext = dao.getotherBoardContent("next", idx);
		
		List<ReplyBoardVO> replyVOS = dao.getReplyBoard(idx);
		
		if (replyIdx != 0) {
			String replyContent = dao.getReply(replyIdx);
			request.setAttribute("replyContent", replyContent);
		}
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("lately", lately);
		request.setAttribute("voPrev", voPrev);
		request.setAttribute("voNext", voNext);
		request.setAttribute("sw", sw);
		request.setAttribute("replyIdx", replyIdx);
		request.setAttribute("replyVOS", replyVOS);
		
	}

}
