package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVo;

public class AdMemberListCommand implements AdimnInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		int pageSize = 5;
		int totRecCnt = dao.totRecCnt();
		int totPage;
		if (totRecCnt % pageSize == 0) {
			totPage = totRecCnt / pageSize;
		} else {
			totPage = totRecCnt / pageSize + 1;
		}
		int pag = 1;
		if (request.getParameter("pag") != null) {
			pag = Integer.parseInt(request.getParameter("pag"));
		}
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		ArrayList<MemberVo> vos = dao.getMemberList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		
	}

}
