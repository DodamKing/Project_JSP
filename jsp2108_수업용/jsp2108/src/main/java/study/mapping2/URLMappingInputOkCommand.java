package study.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class URLMappingInputOkCommand implements URLInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = "";
		int age = 0;
		
		if (request.getParameter("name") != null) {
			name = request.getParameter("name");
		}
		if (request.getParameter("name") != null) {
			age = Integer.parseInt(request.getParameter("age"));
		}
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
		vo.setName(name);
		vo.setAge(age);
		
		int res = dao.setUserInputOk(vo);
		
		if (res == -1) {
			request.setAttribute("msg", "userInputNO");
		} else {
			request.setAttribute("msg", "userInputOk");
		}
		request.setAttribute("url", request.getContextPath() + "/urlMappingList.um");
	}

}
