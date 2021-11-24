package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/bogoodTwo")
public class BogoodServletTwo extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String res = "0";

		BoardDAO dao = new BoardDAO();
		
		HttpSession session = request.getSession(); 
		ArrayList<String> goodIdx = (ArrayList<String>) session.getAttribute("sGoodIdx"); 
		if (goodIdx == null) {
			goodIdx = new ArrayList<String>();
			session.setAttribute("sGoodIdx", goodIdx);
		}
		String goodIdx_item = "good_" + idx;
		if (!goodIdx.contains(goodIdx_item)) {
			dao.setGoodUpdate(idx);
			goodIdx.add(goodIdx_item);
			res = "1";
		}
		response.getWriter().write(res);
	}
}
