package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoReplyInputCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardIdx = 0;
		String mid = "";
		String nickName = "";
		String hostIp = "";
		int lately = 1;
		int pag = 1;
		int pageSize = 5;
		String content = "";
		
		if (request.getParameter("boardIdx") != null) {
			boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
		}
		if (request.getParameter("mid") != null) {
			mid = request.getParameter("mid");
		}
		if (request.getParameter("nickName") != null) {
			nickName = request.getParameter("nickName");
		}
		if (request.getParameter("hostIp") != null) {
			hostIp = request.getParameter("hostIp");
		}
		if (request.getParameter("lately") != null) {
			lately = Integer.parseInt(request.getParameter("lately"));
		}
		if (request.getParameter("pag") != null) {
			pag = Integer.parseInt(request.getParameter("pag"));
		}
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		if (request.getParameter("content") != null) {
			content = request.getParameter("content");
		}
		
		ReplyBoardVO replyBoardVO = new ReplyBoardVO();
		replyBoardVO.setBoardIdx(boardIdx);
		replyBoardVO.setMid(mid);
		replyBoardVO.setNickName(nickName);
		replyBoardVO.setHostIp(hostIp);
		replyBoardVO.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		dao.replyInput(replyBoardVO);
		
		request.setAttribute("msg", "replyBoardInputOk");
		request.setAttribute("url", "boContent.bo?idx=" + boardIdx +"&pag=" + pag + "&pageSize=" + pageSize + "&lately=" + lately);
	}

}
