package study.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class URLMappingUpdateOkCommand implements URLInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = "";
		int age = 0;
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		if (request.getParameter("name") != null) {
			name = request.getParameter("name");
		}
		if (request.getParameter("name") != null) {
			age = Integer.parseInt(request.getParameter("age"));
		}
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
		vo.setIdx(idx);
		vo.setName(name);
		vo.setAge(age);
		
		int res = dao.setUserUpdateOk(vo);
		
		if (res == -1) {
			request.setAttribute("msg", "userUpdateNO");
		} else {
			request.setAttribute("msg", "userUpdateOk");
		}
		request.setAttribute("url", request.getContextPath() + "/urlMappingList.um");
	}

}
