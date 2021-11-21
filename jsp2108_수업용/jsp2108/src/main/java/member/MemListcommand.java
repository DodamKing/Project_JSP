package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemListcommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = -1;
		String mid = "";
		if (request.getParameter("level") != null) {
			level = Integer.parseInt(request.getParameter("level"));
		}
		if (request.getParameter("mid") != null) {
			mid = request.getParameter("mid");
		}
		
		MemberDAO dao = new MemberDAO();
		
		int pageSize = 5;
		int totRecCnt = dao.totRecCnt(level, mid);
		int totPage;
		if (totRecCnt % pageSize == 0) {
			totPage = totRecCnt / pageSize;
		} else {
			totPage = totRecCnt / pageSize + 1;
		}
		if (totPage == 0) totPage = 1; 
		int pag = 1;
		if (request.getParameter("pag") != null) {
			pag = Integer.parseInt(request.getParameter("pag"));
			if (pag <= 0) {
				pag = 1;
			}
		}
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		ArrayList<MemberVo> vos = dao.getMemberList(startIndexNo, pageSize, level, mid);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("level", level);
		request.setAttribute("mid", mid);
		
	}

}
