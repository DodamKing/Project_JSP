package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberVo;

public class BoListCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		int pageSize = 5;
		if (request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		int totRecCnt = dao.totRecCnt();
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
			else if (pag > totPage) {
				pag = totPage;
			}
		}
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = 0; 
		if ((totPage % blockSize) == 0) {
			lastBlock = totPage / blockSize - 1;
		} else {
			lastBlock = totPage / blockSize;
		}
		
		if (curBlock < 1) {
			curBlock = 0;
		}
		else if (curBlock > lastBlock) {
			curBlock = lastBlock;
			pag = totPage;
		}
		
		List<BoardVO> vos = dao.getBoardList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("pageSize", pageSize);
		
	}

}
