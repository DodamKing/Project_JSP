package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.mapping2.UserDAO;
import study.mapping2.UserVO;

public class UserUpdateOkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
		vo.setIdx(idx);
		vo.setName(name);
		vo.setAge(age);
		dao.setUserUpdateOk(vo);
	}

}
