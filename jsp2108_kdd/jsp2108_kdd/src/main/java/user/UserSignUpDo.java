package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserSignUpDo implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		// 회원 가입 인풋 값 받아서 vo에 넣고 dao에서 디비에 저장하고 forword 시키면 될 듯
	}

}
