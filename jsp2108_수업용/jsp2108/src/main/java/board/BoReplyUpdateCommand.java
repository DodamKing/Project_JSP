package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoReplyUpdateCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int replyIdx = 0;
		String content = "";
		
		if (request.getParameter("replyIdx") != null) {
			replyIdx = Integer.parseInt(request.getParameter("replyIdx"));
		}
		if (request.getParameter("content") != null) {
			content = request.getParameter("content");
		}

		System.out.println("r : " + replyIdx);
		
		BoardDAO dao = new BoardDAO();
		dao.setReplyUpdate(replyIdx, content);
		response.getWriter().write(replyIdx);
		
	}

}
